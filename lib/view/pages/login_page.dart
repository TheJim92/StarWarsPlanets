import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_planets/model/remote_data_source.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isAuthenticating = false;

  void toggleAuth() {
    setState(() {
      isAuthenticating = !isAuthenticating;
    });
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
                  onEditingComplete: () => username = usernameController.text,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  controller: passwordController,
                  onEditingComplete: () => password = passwordController.text,
                ),
                ElevatedButton(
                  onPressed: () async {
                    toggleAuth();
                    http.Response response =
                        await RemoteDataSource().login(username, password);
                    toggleAuth();
                    if (response.statusCode == 200 && context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const PlanetsPage(title: 'Planets'),
                        ),
                      );
                    } else {
                      var snackBar = SnackBar(
                        content: Text(
                            "${response.statusCode} ${response.reasonPhrase ?? ""}"),
                      );
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
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
                            const PlanetsPage(title: 'Planets'),
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
