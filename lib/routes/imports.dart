//Librerias principales
//Son aquellas que vienen con la app y librerias de terceros
export 'package:flutter/material.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:go_router/go_router.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:hooks_riverpod/hooks_riverpod.dart';

//Logica - Feature: Emails
export 'package:gmail_clone/logic/emails/model/email_model.dart';
export 'package:gmail_clone/logic/emails/model/email_extensions.dart';
export 'package:gmail_clone/logic/emails/data/email_data_source.dart';
export 'package:gmail_clone/logic/emails/data/email_repository.dart';
export 'package:gmail_clone/logic/emails/data/email_providers.dart';
export 'package:gmail_clone/logic/emails/presentation/email_controller.dart';

//Logica - Feature: Auth
export 'package:gmail_clone/logic/auth/model/auth_state.dart';
export 'package:gmail_clone/logic/auth/presentation/auth_controller.dart';

//

//Rutas
//Exportaciones o rutas generales
//
export 'package:gmail_clone/app.dart';

//Pantallas
// Todo lo que el usuario maneja
//
export 'package:gmail_clone/screens/inicial.dart';
export 'package:gmail_clone/screens/iniciar_sesion.dart';
export 'package:gmail_clone/screens/sign_up.dart';
export 'package:gmail_clone/screens/dashboard.dart';

//Widgets personalizados
// Todos los widgets reutilizables que vayamos a contruir
//
export 'package:gmail_clone/widgets/email.detail.dart';

//Temas
//Constantes y temas
export 'package:gmail_clone/themes/const.dart';
