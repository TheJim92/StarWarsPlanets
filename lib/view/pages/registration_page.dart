import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_planets/view/pages/planets_page.dart';

import '../../model/remote_data_source.dart';
import '../../utils/snackbars.dart';
import '../../utils/validators.dart';
import '../supporting_widgets/text_field_widget.dart';

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
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
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
      if (mounted) {
        SnackBars.showSnackBar('Error: $errorString', context);
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
      if (mounted) {
        SnackBars.showSnackBar(
            '${response.statusCode} ${response.reasonPhrase ?? ""}', context);
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Form(
                key: registrationFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextFieldWidget(controller: usernameController, label: 'Nome utente', validator: Validator.emptyField),
                        TextFieldWidget(controller: passwordController, label: 'Password', validator: Validator.emptyField),
                        TextFieldWidget(controller: firstNameController, label: 'Nome', validator: Validator.emptyField),
                        TextFieldWidget(controller: lastNameController, label: 'Cognome', validator: Validator.emptyField),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (registrationFormKey.currentState!.validate()) {
                              var response = await checkUsername();
                              if (response == true) {
                                sendData();
                              }
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
                    )
                  ],
                ),
              ),
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
