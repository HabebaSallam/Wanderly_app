import 'package:flutter/material.dart';
import 'package:lab2_mobileprogramming/screens/signup_screen.dart';

import 'screens/start_screen.dart';

import 'package:go_router/go_router.dart';

import 'screens/destinations_screen.dart';

void main() {

  runApp(const WanderlyApp());

}

class WanderlyApp extends StatefulWidget {

  const WanderlyApp({super.key});


  @override

  State<WanderlyApp> createState() => _WanderlyAppState();

}

class _WanderlyAppState extends State<WanderlyApp> {

  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {

    setState(() {

      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    });

  }

  static const Color seed = Color.fromARGB(255, 1, 57, 24);

  @override

  Widget build(BuildContext context) {

    return MaterialApp.router(

      theme: ThemeData(

        colorSchemeSeed: seed,

      ),

      darkTheme: ThemeData(

        colorSchemeSeed: seed,

        brightness: Brightness.dark,

      ),

      themeMode: _themeMode,

      debugShowCheckedModeBanner: false,

      routerConfig: GoRouter(

        routes: [

          GoRoute(

            path: '/',

            builder: (context, state) => StartScreen(onThemeToggle: _toggleTheme, name: '',),

          ),

          GoRoute(

            path: '/destinations',

            builder: (context, state) => const DestinationsScreen(),

          ),

          GoRoute(
            path: '/signup',

            builder: (context, state) => const SignUpScreen(),

          ),

        ],

      ),

    );

  }

}
