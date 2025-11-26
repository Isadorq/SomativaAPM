import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Criar Conta")),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            TextField(controller: nome,  decoration: const InputDecoration(labelText: "Nome")),
            TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: senha, decoration: const InputDecoration(labelText: "Senha"), obscureText: true),
            const SizedBox(height: 18),

            ElevatedButton(
              onPressed: ()=> Navigator.pushNamed(context, "/login"),
              child: const Text("Registrar")
            ),
          ],
        ),
      ),
    );
  }
}
