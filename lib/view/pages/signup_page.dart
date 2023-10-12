import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_planets/view/pages/planets_page.dart';

import '../../model/remote_data_source.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String username = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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
            title: const Text('Registrazione'),
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
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                  controller: firstNameController,
                  onEditingComplete: () => firstName = firstNameController.text,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Cognome'),
                  ),
                  controller: lastNameController,
                  onEditingComplete: () => lastName = lastNameController.text,
                ),
                ElevatedButton(
                  onPressed: () async {
                    toggleAuth();
                    http.Response response =
                        await RemoteDataSource().signUp(username, password, firstName, lastName);
                    toggleAuth();
                    if (response.statusCode == 200 && context.mounted) {
                      //jsonEncode nel datasource potrebbe essere la causa per cui lo username "prova" non ritorna l'errore
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
                  child: const Text('Registrati'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Torna al login'),
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
