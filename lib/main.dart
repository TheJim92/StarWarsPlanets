import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_planets/view/pages/login_page.dart';
import 'package:star_wars_planets/viewmodel/planets_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlanetsViewmodel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Planets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
