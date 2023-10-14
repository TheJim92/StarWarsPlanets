import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';
import 'package:star_wars_planets/view/pages/registration_page.dart';
import 'package:star_wars_planets/view/supporting_widgets/text_field_widget.dart';

import '../../utils/snackbars.dart';
import '../../utils/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // A simple local login check
  void verifyLogin() {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username == "Luke" && password == "skywalker") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlanetsPage(),
        ),
      );
    } else {
      if (mounted) {
        SnackBars.showSnackBar('Nome utente o password errati.', context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      //Background image
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/background_portrait_right.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: SingleChildScrollView(
          // Allow scrolling when keyboard is on
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            // Force screen size to prevent scrolling when fullscreen
            height: screenHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Star Wars Planets logo
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Image.asset("assets/planets_logo_center.png",
                        height: screenHeight / 3),
                  ),

                  // Login form
                  Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                            controller: usernameController,
                            label: 'Nome utente',
                            validator: Validator.emptyField),
                        TextFieldWidget(
                            controller: passwordController,
                            label: 'Password',
                            validator: Validator.emptyField),
                      ],
                    ),
                  ),

                  // Buttons
                  Column(
                    children: [
                      //Access button
                      ElevatedButton(
                          onPressed: () => loginFormKey.currentState!.validate()
                              ? verifyLogin()
                              : null,
                          child: const Text('Accedi')),

                      //Registration button
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Registrati',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
