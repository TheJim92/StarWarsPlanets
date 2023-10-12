import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';
import 'package:star_wars_planets/view/pages/signup_page.dart';

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
          builder: (context) =>
          const PlanetsPage(title: 'Planets'),
        ),
      );
    } else {
      var snackBar = const SnackBar(
        content: Text(
            "Nome utente o password errati."),
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
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Center(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Nome utente'),
                  ),
                  controller: usernameController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  controller: passwordController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    verifyLogin();
                    /* FutureBuilder<String>(
                        future: RemoteDataSource().login(username, password),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PlanetsPage(title: 'Planets'),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                          }
                          return const Center(child: CircularProgressIndicator());
                        });*/
                  },
                  child: const Text('Accedi'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                             const SignupPage(),
                      ),
                    );
                  },
                  child: const Text('Registrati'),
                )
              ],
            ),
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
