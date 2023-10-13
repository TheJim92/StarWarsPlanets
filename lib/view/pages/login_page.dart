import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';
import 'package:star_wars_planets/view/pages/registration_page.dart';

import '../../theme/res/color_set.dart';
import '../../utils/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isAuthenticating = false;

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
      var snackBar = const SnackBar(
        content: Text("Nome utente o password errati."),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              Image.asset("assets/background_portrait_right.png",
                  fit: BoxFit.cover),
              Container(color: Colors.black.withAlpha(160)),
              Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Image.asset("assets/planets_logo_center.png"),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                label: Text('Nome utente',
                                    style:
                                        TextStyle(color: AppColor.secondary)),
                              ),
                              controller: usernameController,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                label: Text(
                                  'Password',
                                  style: TextStyle(color: AppColor.secondary),
                                ),
                              ),
                              controller: passwordController,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  verifyLogin();
                                },
                                child: const Text(
                                  'Accedi',
                                  style: TextStyle(color: AppColor.primary),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: AppColor.primary, width: 2)),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegistrationPage(),
                                ),
                              );
                            },
                            child: const Text('Registrati',
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ],
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
