import 'package:gmail_clone/routes/imports.dart';

// Configuraciones fijas de nuestra aplicacion movil
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GMAIL CLONE",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => PortalInicial(),
        "/iniciar_sesion": (context) => Pantalla2(),
      },

      initialRoute: "/",
    );
  }
}
