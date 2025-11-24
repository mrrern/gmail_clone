# Plan de Migración de Datos: de JSON Local a Supabase

Este documento detalla los pasos necesarios para migrar la capa de datos de la aplicación, pasando de leer un archivo JSON local (`asset/data.json`) a utilizar Supabase como backend.

---

## Análisis de la Arquitectura Actual

Antes de la migración, es importante entender cómo funciona la aplicación actualmente:

*   **Fuente de Datos**: Toda la información de los correos electrónicos se carga desde el archivo `asset/data.json`.
*   **Lógica de Carga**: La clase `EmailServices` (ubicada en `lib/logic/email_services.dart`) contiene el método `getEmails()` que es responsable de leer y procesar el contenido de `asset/data.json`.
*   **Gestión de Estado**: Un `FutureProvider` de Riverpod, llamado `leemeLosDatos` (definido también en `lib/logic/email_services.dart`), se encarga de exponer los datos procesados a la interfaz de usuario de manera reactiva.
*   **Consumo en la UI**: La pantalla principal, `Dashboard` (en `lib/screens/dashboard.dart`), utiliza `ref.watch(leemeLosDatos)` para obtener la lista de correos electrónicos y mostrarlos.

Gracias a la abstracción proporcionada por Riverpod, la interfaz de usuario (`Dashboard`) está desacoplada de la fuente de datos, lo que significa que los cambios en la lógica de obtención de datos no deberían requerir modificaciones en la UI.

---

## Plan Paso a Paso para la Migración a Supabase

Sigue estos pasos para realizar la migración:

### Paso 1: Configurar Supabase en tu Proyecto Flutter

Este paso implica añadir la dependencia de Supabase e inicializar el cliente en tu aplicación.

1.  **Añadir la dependencia `supabase_flutter`**:
    *   Abre el archivo `pubspec.yaml` en la raíz de tu proyecto.
    *   Bajo la sección `dependencies:`, añade la siguiente línea:

        ```yaml
        dependencies:
          flutter:
            sdk: flutter
          # ... otras dependencias existentes
          supabase_flutter: ^2.5.0 # Asegúrate de usar la versión más reciente
        ```
    *   Guarda el archivo y ejecuta `flutter pub get` en tu terminal para descargar el paquete.

2.  **Inicializar Supabase en `lib/main.dart`**:
    *   Abre el archivo `lib/main.dart`.
    *   Importa el paquete de Supabase.
    *   Convierte la función `main` en `async` y añade la inicialización de Supabase antes de `runApp()`.

    ```dart
    // lib/main.dart
    import 'package:flutter/material.dart';
    import 'package:gmail_clone/app.dart';
    import 'package:supabase_flutter/supabase_flutter.dart'; // Importa el paquete de Supabase
    import 'package:flutter_riverpod/flutter_riverpod.dart'; // Asegúrate de que Riverpod esté importado si lo usas en main

    void main() async { // Convierte main en async
      WidgetsFlutterBinding.ensureInitialized(); // Asegura que los bindings de Flutter estén inicializados

      // Inicializa Supabase con tu URL y Anon Key
      await Supabase.initialize(
        url: 'https://xehqtipqkxavbeyxzhbo.supabase.co', // **IMPORTANTE: Reemplaza con la URL de tu proyecto Supabase**
        anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhlaHF0aXBxa3hhdmJleXh6aGJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQwMDk3NzcsImV4cCI6MjA3OTU4NTc3N30.IWt8G7z5RiH2GIzJOl41aMEiXhJjs5rHuGqOmghknlM', // **IMPORTANTE: Reemplaza con la Anon Key de tu proyecto Supabase**
      );

      runApp(
        const ProviderScope( // Si usas Riverpod, envuelve tu app en ProviderScope
          child: MyApp(),
        ),
      );
    }
    ```
    *   **Nota Importante**: Antes de ejecutar la aplicación, asegúrate de haber creado un proyecto en Supabase y una tabla (por ejemplo, `emails`) con columnas que coincidan con la estructura de tu `EmailModel` (e.g., `id`, `from`, `subject`, `body`, `read`, `date`).

### Paso 2: Actualizar la Lógica de Carga de Datos en `EmailServices`

Este es el paso central donde se cambia la fuente de datos.

1.  **Modificar `lib/logic/email_services.dart`**:
    *   Abre el archivo `lib/logic/email_services.dart`.
    *   Importa el paquete `supabase_flutter`.
    *   Modifica el método `getEmails()` para que realice una consulta a Supabase en lugar de leer el archivo JSON local.

    ```dart
    // lib/logic/email_services.dart
    import 'dart:convert'; // Puede que ya no sea necesario si no lees JSON local
    import 'package:flutter/services.dart'; // Puede que ya no sea necesario
    import 'package:flutter_riverpod/flutter_riverpod.dart';
    import 'package:gmail_clone/logic/controller/email/email_model.dart';
    import 'package:supabase_flutter/supabase_flutter.dart'; // Importa el paquete de Supabase

    // El provider 'leemeLosDatos' no necesita cambios, ya que llama a getEmails()
    final leemeLosDatos = FutureProvider<List<EmailModel>>((ref) {
      final emailServices = ref.watch(emailServicesProvider);
      return emailServices.getEmails();
    });

    final emailServicesProvider = Provider((ref) => EmailServices());

    class EmailServices {
      // Obtiene la instancia del cliente de Supabase
      final _supabase = Supabase.instance.client;

      Future<List<EmailModel>> getEmails() async {
        try {
          // 1. Realiza la consulta a la tabla 'emails' en Supabase
          // Asegúrate de que 'emails' sea el nombre de tu tabla en Supabase
          final List<Map<String, dynamic>> data = await _supabase
              .from('emails')
              .select(); // Puedes añadir .order('date', ascending: false) si quieres ordenar

          // 2. Convierte la respuesta de Supabase (List<Map<String, dynamic>>)
          // en una lista de objetos EmailModel utilizando el constructor fromJson.
          final List<EmailModel> emails = data
              .map((item) => EmailModel.fromJson(item))
              .toList();

          return emails;

        } catch (e) {
          // Manejo de errores: imprime el error y devuelve una lista vacía
          print('Error al obtener correos de Supabase: $e');
          return [];
        }
      }
    }
    ```

### Paso 3: Verificación y Limpieza (Opcional)

1.  **Verificar la Aplicación**: Ejecuta tu aplicación. Si todo está configurado correctamente, la pantalla `Dashboard` debería mostrar los correos electrónicos obtenidos de tu base de datos de Supabase.
2.  **Eliminar `asset/data.json`**: Una vez que hayas confirmado que la aplicación funciona correctamente con Supabase, puedes eliminar el archivo `asset/data.json` y cualquier referencia a la lectura de assets locales que ya no sea necesaria (como `rootBundle.loadString`).

---

Con estos pasos, habrás migrado exitosamente la capa de datos de tu aplicación de un archivo JSON local a Supabase, manteniendo la arquitectura limpia y desacoplada.