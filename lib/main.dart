
import 'package:pagos_en_linea_emi/config/router/app_router.dart';
import 'package:pagos_en_linea_emi/presentation/providers/auth_provider.dart';
import 'package:pagos_en_linea_emi/presentation/providers/theme_provider.dart';
import 'package:pagos_en_linea_emi/presentation/providers/buscar_estudiante_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider(),),
        ChangeNotifierProvider(create: (context)=> BuscarEstudianteProvider(),),
        ChangeNotifierProvider(create: (context)=> AuthProvider(),),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final providerTheme = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Aplicacion v1',
      routerConfig: AppRouter.appRouter,
      theme: providerTheme.currentTheme
    );
  }
}
