import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_planets/view/pages/planets_page.dart';

import '../../model/remote_data_source.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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

  Future<bool> checkUsername() async {
    toggleAuth();
    http.Response response =
        await RemoteDataSource().checkUsername(usernameController.text);
    toggleAuth();
    if (!response.body.contains('error') && context.mounted) {
      return true;
    } else {
      //TODO: Vedi se riesci a prendere meglio l'errore
      List<String> errorStringList = response.body.split('"');
      String errorString = errorStringList[errorStringList.length - 2];
      var snackBar = SnackBar(
        content: Text("Error: $errorString"),
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      return false;
    }
  }

  void sendData() async {
    toggleAuth();
    http.Response response = await RemoteDataSource().registration(
        usernameController.text,
        passwordController.text,
        firstNameController.text,
        lastNameController.text);
    toggleAuth();
    if (response.statusCode == 200 && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlanetsPage(),
        ),
      );
    } else {
      var snackBar = SnackBar(
        content: Text("${response.statusCode} ${response.reasonPhrase ?? ""}"),
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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Registrazione'),
          ),
          body: Center(
            child: Column(
              children: [
                TextFormField(
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
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                  controller: firstNameController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text('Cognome'),
                  ),
                  controller: lastNameController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var response = await checkUsername();
                    if (response == true) {
                      sendData();
                    }
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
