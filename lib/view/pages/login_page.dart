import 'package:flutter/material.dart';
import 'package:star_wars_planets/view/pages/planets_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                label: Text('Nome utente'),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Password'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlanetsPage(title: 'Planets'),
                  ),
                );
              },
              child: const Text('Accedi'),
            )
          ],
        ),
      ),
    );
  }
}
