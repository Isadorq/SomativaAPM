import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Mange Eats 🍽"),
        actions: [
          IconButton(
            onPressed:()=> Navigator.pushNamed(context,"/cart"),
            icon: const Icon(Icons.shopping_bag_outlined)
          )
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()=> Navigator.pushNamed(context,"/menu"), child: const Text("Ver Cardápio")),
            ElevatedButton(onPressed: ()=> Navigator.pushNamed(context,"/login"), child: const Text("Sair")),
          ],
        ),
      ),
    );
  }
}
