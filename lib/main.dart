import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_planets/theme/app_theme.dart';
import 'package:star_wars_planets/view/pages/login_page.dart';
import 'package:star_wars_planets/viewmodel/planets_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Locks screen orientation to portraitUp
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(

      // ChangeNotifierProvider is needed to create persistent viewmodels with Provider package
      ChangeNotifierProvider(
        create: (context) => PlanetsViewmodel(),
        child: const MyApp(),
      ),
    ),
  );

  // Sets Android system navigation bar to black
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars Planets',

      // themeMode forces Dark Theme, as it was a better foundation for the desired visual style.
      // darkTheme is then set to a custom theme.
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.dark,

      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
