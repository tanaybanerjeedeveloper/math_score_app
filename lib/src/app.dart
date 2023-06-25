import 'package:flutter/material.dart';
import 'package:match_app/src/routing/app_router.dart';
//import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: const Color(0xffEFF6FF),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      // cardTheme: const CardTheme(
      //   elevation: 2,
      //   color: Colors.white,
      // ),
    );

    return MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        onGenerateTitle: (BuildContext context) => 'Match',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.white,
            primary: Color(0xff0053BE),
          ),
        ));
  }
}
