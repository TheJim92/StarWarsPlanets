import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';

import '../../model/remote_data_source.dart';
import '../../utils/snackbars.dart';
import '../../utils/validators.dart';
import '../supporting_widgets/custom_text_field.dart';

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

  Future<String> checkUsername() async {
    toggleAuth();
    String responseMessage =
        await RemoteDataSource().checkUsername(usernameController.text);
    toggleAuth();
    return responseMessage;
  }

  void sendData() async {
    toggleAuth();
    String responseMessage = await RemoteDataSource().registration(
        usernameController.text,
        passwordController.text,
        firstNameController.text,
        lastNameController.text);
    toggleAuth();
    if (responseMessage == 'success' && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlanetsPage(),
        ),
      );
      SnackBars.showSnackBar('Registrazione avvenuta correttamente.', context);
    } else {
      if (mounted) {
        SnackBars.showSnackBar(
            responseMessage, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/space3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: const Text('Registrazione'),
        ),
        body: isAuthenticating
            ? Container(
                decoration: BoxDecoration(color: Colors.black.withAlpha(128)),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: screenHeight - 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: Form(
                      key: registrationFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text fields
                          Column(
                            children: [
                              CustomTextField(
                                controller: usernameController,
                                label: 'Nome utente',
                                validator: Validator.emptyField,
                              ),
                              CustomTextField(
                                controller: passwordController,
                                label: 'Password',
                                validator: Validator.emptyField,
                              ),
                              CustomTextField(
                                controller: firstNameController,
                                label: 'Nome',
                                validator: Validator.emptyField,
                              ),
                              CustomTextField(
                                controller: lastNameController,
                                label: 'Cognome',
                                validator: Validator.emptyField,
                              ),
                            ],
                          ),

                          // Buttons
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  if (registrationFormKey.currentState!
                                      .validate()) {
                                    var responseMessage = await checkUsername();
                                    if (responseMessage == 'success') {
                                      sendData();
                                    } else {
                                      if (mounted) {
                                        SnackBars.showSnackBar(
                                            responseMessage, context);
                                      }
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
      ),
    );
  }
}
