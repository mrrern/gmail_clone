import 'package:gmail_clone/routes/imports.dart';

final GoRouter routes = GoRouter(
  initialLocation: "/",

  routes: [
    GoRoute(path: "/", builder: (context, state) => PortalInicial()),
    GoRoute(path: '/iniciar_sesion', builder: (context, state) => Pantalla2()),
    GoRoute(path: "/crear_cuenta", builder: (context, state) => ScreenSign()),
    GoRoute(path: '/dashboard', builder: (context, state) => Dashboard()),
    GoRoute(path: '/email/:id', builder: (context, state) {
      final email = state.extra as EmailModel;
      return DetailEmail(email: email);
    },)
  ],
);
