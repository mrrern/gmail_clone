import 'package:gmail_clone/routes/imports.dart';
import 'package:gmail_clone/routes/routes.dart';

// Configuraciones fijas de nuestra aplicacion movil
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "GMAIL CLONE",
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
