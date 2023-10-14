import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';
import 'package:star_wars_planets/view/pages/registration_page.dart';

import '../../theme/res/color_set.dart';
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
  bool isAuthenticating = false;
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
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Image.asset("assets/background_portrait_right.png",
                  fit: BoxFit.cover),
              Container(color: Colors.black.withAlpha(160)),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Image.asset("assets/planets_logo_center.png", height: screenHeight/3),
                      ),
                      Form(
                        key: loginFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Nome utente',
                                    style:
                                        TextStyle(color: AppColor.secondary)),
                              ),
                              controller: usernameController,
                              validator: (input) {
                                return Validators.validateField(
                                    Validator.emptyField, input);
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text(
                                  'Password',
                                  style: TextStyle(color: AppColor.secondary),
                                ),
                              ),
                              controller: passwordController,
                              validator: (input) {
                                return Validators.validateField(
                                    Validator.emptyField, input);
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (loginFormKey.currentState!.validate()) {
                                verifyLogin();
                              }
                            },
                            child: const Text(
                              'Accedi',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationPage(),
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
            ],
          ),
        ),
        isAuthenticating
            ? Container(
                decoration: BoxDecoration(color: Colors.black.withAlpha(128)),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
