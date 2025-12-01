Este *markdown* detalla la metodología y las reglas esenciales para crear un proyecto Flutter nuevo o reestructurar uno existente, asegurando su **mantenibilidad y escalabilidad** a través de una **arquitectura de capas** clara y una **estructura Feature-first** (característica primero).

***

# Guía de Implementación: Arquitectura Escalable de Flutter con Riverpod

La elección de una arquitectura de aplicación adecuada es crucial para manejar la complejidad a medida que el código base crece. Una buena arquitectura garantiza una **buena separación de responsabilidades** entre el código de la UI, la lógica de negocio y la lógica de acceso a datos.

Esta arquitectura de referencia se apoya fuertemente en el paquete **Riverpod** para el manejo reactivo del estado y el enlace de datos (*data-binding*).

## 1. Estructura del Proyecto: Enfoque Feature-first

Para aplicaciones medianas a grandes, el enfoque *Feature-first* es más escalable que el *Layer-first*.

### Principio Fundamental

La estructura debe organizarse en torno a los **requisitos funcionales** de la aplicación (lo que el usuario *hace*), y no en torno a las pantallas específicas de la UI.

Se recomienda empezar por la **Capa de Dominio** para identificar los modelos y la lógica de negocio, y luego crear una carpeta para cada modelo o grupo de modelos que "pertenecen juntos".

### Estructura de Directorios Recomendada

La estructura debe reflejar las áreas funcionales y la arquitectura de capas, generalmente dentro de la carpeta `lib/src`:

```
‣ lib
    ‣ logic (Contiene todas las áreas funcionales/features)
      ‣ feature_name_1 (Ej: authentication, products)
        ‣ application (Servicios opcionales)
        ‣ data (Repositorios, Fuentes de Datos, DTOs)
        ‣ model (Modelos, lógica de negocio)
      ‣ feature_name_2 (Ej: orders, cart)
        ‣ ...
    
    ‣ routes
        ‣ imports.dart
        ‣ routes.dart
    ‣ widgets (Widgets reutilizables en múltiples features)
    ‣ screens (Screens utilizables en la app)
    ‣ themes
        ‣ const.dart
        ‣ themes.dart
    ‣ exceptions
    
‣ test (Debe seguir la misma estructura que 'lib' para facilitar las pruebas)
```

**Para un proyecto existente:** Si está modificando un proyecto existente, el primer paso de migración es **reorganizar los archivos** para que se agrupen por funcionalidad (*feature*) en lugar de por capa, y luego introducir las subcarpetas de capas (data, domain, presentation) dentro de cada *feature*.

## 2. Reglas y Responsabilidades de las Capas

La arquitectura se compone de **cuatro capas** con un **contrato claro** para la comunicación. El flujo de datos es **unidireccional** desde la capa de Datos hasta la UI.

### A. Capa de Dominio (*Domain Layer*)

Define los modelos de datos (entidades) y la lógica de negocio específica para manipularlos.

| Regla | Componente | Descripción y Fuente |
| :--- | :--- | :--- |
| **Modelos Inmutables** | Clases Modelo | Los modelos (como `Cart` o `Product`) deben ser siempre **inmutables**. Cualquier mutación (cambio) debe realizarse devolviendo una **nueva copia inmutable**. |
| **Inclusión de Lógica** | Extensiones | La lógica de negocio de bajo nivel (ej. cómo añadir un ítem a un carrito) reside en esta capa, a menudo implementada en **extensiones**. |
| **Aislamiento Total** | Clases Modelo | Los modelos **no deben tener dependencias** (acceso a repositorios, servicios u objetos) que provengan de capas externas. |
| **Serialización** | Clases Modelo | Deben contener la lógica de serialización, como los métodos `fromJson` y `toJson`. |
| **Comprobabilidad** | Lógica de Negocio | Esta lógica debe ser fácil de **probar con *unit tests*** sin necesidad de *mocks*. |

### B. Capa de Datos (*Data Layer*)

Se encarga de acceder a la fuente de datos (bases de datos locales, APIs externas) y proporcionar modelos *type-safe* al resto de la aplicación.

| Regla | Componente | Descripción y Fuente |
| :--- | :--- | :--- |
| **El Repositorio es la Puerta de Enlace** | Repositorios | Los repositorios son la **puerta de enlace (*gateway*)** a la fuente única de verdad de los datos. |
| **Ocultar Detalles de Implementación** | Repositorios | Los repositorios deben ocultar los detalles de la fuente de datos (ej. JSON, HTTP *clients*, bases de datos). Si una API cambia, solo se debe actualizar el código del repositorio. |
| **Conversión de Datos** | Repositorios | Se encargan de tomar los **DTOs (Data Transfer Objects)**, que son datos no estructurados (ej. JSON), y convertirlos en las **clases modelo *type-safe*** (entidades) de la Capa de Dominio. |
| **Fuentes de Datos** | Data Sources | Clases que interactúan directamente con APIs de terceros (ej. un cliente REST, una base de datos). |
| **Escalabilidad Horizontal** | Repositorios | Si un repositorio acumula muchos métodos debido a una gran superficie de API, considere crear **múltiples repositorios** relacionados (ej. `ProductRepository`, `OrderRepository`). |

### C. Capa de Aplicación (*Application Layer*)

Es una capa **opcional** que actúa como intermediario para manejar lógica compleja compartida o que involucra a varios repositorios.

| Regla | Componente | Descripción y Fuente |
| :--- | :--- | :--- |
| **Uso Condicional** | Servicios (*Services*) | Solo se debe introducir una clase de servicio si la lógica **depende de múltiples repositorios** o **necesita ser compartida** por más de un *widget*. |
| **Evitar Redundancia** | Servicios | **No hay necesidad** de crear una clase de servicio si todo lo que hace es reenviar llamadas de método de un controlador a un repositorio. En ese caso, el controlador debe depender directamente del repositorio. |
| **Mediación** | Servicios | Los servicios median entre los controladores (que gestionan el estado de la UI) y los repositorios (que acceden a los datos). |
| **No Gestión de Estado** | Servicios | Los servicios **no deben gestionar ni actualizar el estado del *widget*** (a diferencia de un controlador). |

### D. Capa de Presentación (*Presentation Layer*)

Muestra los datos y maneja las interacciones del usuario. Es fundamental **separar la lógica de negocio del código de la UI**.

| Regla | Componente | Descripción y Fuente |
| :--- | :--- | :--- |
| **Componentes** | Widgets y Controllers | Esta capa contiene **Widgets** (la representación visual) y **Controllers** (que gestionan el estado del *widget* y realizan mutaciones asíncronas). |
| **Rol del Widget** | Widgets (Stateless/Consumer) | Los *widgets* se limitan a: **Observar** los cambios de estado del controlador (`ref.watch`) y **Responder** a la entrada del usuario llamando a los métodos del controlador (`ref.read().notifier`). |
| **Rol del Controller** | Controllers (AsyncNotifier) | El controlador (similar a un *View Model* o *Cubit*) media entre el *Widget* y el Repositorio/Servicio. Su trabajo es **gestionar el estado del *widget*** (datos, carga, error). |
| **Gestión Asíncrona** | Controllers | Para las mutaciones de datos (ej. iniciar sesión), los controladores deben usar el estado `AsyncValue<T>` y la función `AsyncValue.guard` para manejar consistentemente los estados de carga y error. |
| **Lógica Específica del Widget** | Controllers | El controlador es el lugar ideal para almacenar la lógica de negocio **específica del *widget***, ya que es fácil de probar unitariamente al no depender del código de la UI. |

## 3. Pasos de Creación y Modificación del Proyecto

Para comenzar un proyecto nuevo o reestructurar uno existente, siga estos pasos enfocados en la arquitectura Feature-first y la Capa de Dominio:

1.  **Instalar Riverpod:** Asegúrese de tener Riverpod configurado, ya que la arquitectura depende de sus características de gestión de estado.
2.  **Identificar el Dominio:** Explore los conceptos y comportamientos centrales de la aplicación para definir las **entidades** (modelos).
3.  **Crear la Capa de Dominio (`domain`):** Implemente las clases modelo de Dart (siempre inmutables) y añada la lógica de negocio de bajo nivel (extensiones) para manipularlas. Asegúrese de que no contengan dependencias externas.
4.  **Definir la Estructura Feature-first:** Cree la carpeta `lib/src/features/` y dentro de ella, una carpeta para cada área funcional o grupo de modelos que definió en el Dominio (ej. `products`, `authentication`).
5.  **Implementar la Capa de Datos (`data`):** Dentro de cada *feature*, cree la carpeta `data`. Aquí defina los Repositorios abstractos (opcional) o concretos. Los repositorios deben inyectar las Fuentes de Datos y encargarse de convertir los DTOs (ej. JSON) en Modelos del Dominio.
6.  **Implementar la Capa de Aplicación (`application`):** Si necesita lógica que coordine múltiples repositorios o se comparta entre *widgets*, cree clases de Servicio dentro de la carpeta `application` de la *feature*. Si no es necesario, omita esta capa.
7.  **Implementar la Capa de Presentación (`presentation`):** Dentro de la carpeta `presentation` de la *feature*, cree los **Controllers** (basados en `AsyncNotifier` si son asíncronos) y los **Widgets** (`ConsumerWidget`). El controlador se encarga de llamar a los repositorios/servicios y gestionar el estado (`AsyncValue`).
8.  **Estructura de Pruebas:** Asegúrese de que la carpeta `test` **refleje la misma estructura** que la carpeta `lib` para que las pruebas unitarias y de integración se mantengan organizadas junto con el código que están probando.

***

**En resumen:** Adoptar esta arquitectura de capas junto con la estructura *Feature-first* es como construir un edificio con cimientos (Dominio y Datos) sólidos y paredes (Presentación) claramente separadas de los sistemas internos (Aplicación), permitiendo que múltiples equipos trabajen en diferentes apartamentos (features) sin interferir con la estructura central.