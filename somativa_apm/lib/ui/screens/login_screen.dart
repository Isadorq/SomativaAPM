import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Mange Eats",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
              TextField(controller: email, decoration: InputDecoration(labelText: "Email")),
              TextField(controller: senha, decoration: InputDecoration(labelText: "Senha"), obscureText: true),

              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
                child: const Text("Entrar"),
              ),

              TextButton(
                onPressed: () => Navigator.pushNamed(context, "/register"),
                child: const Text("Criar conta")
              )
            ],
          ),
        )
      )
    );
  }
}
