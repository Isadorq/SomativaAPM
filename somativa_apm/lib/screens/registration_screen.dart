// // lib/screens/registration_screen.dart

// import 'package:somativa_apm/ui/core/app_colors.dart';
// import 'package:somativa_apm/services/api_service.dart';
// import 'package:flutter/material.dart';

// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({super.key});

//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final ApiService _apiService = ApiService(); 
//   bool _isLoading = false; 

//   Future<void> _handleRegister() async {
//     setState(() => _isLoading = true);

//     final name = _nameController.text;
//     final email = _emailController.text;
//     final password = _passwordController.text;

//     final success = await _apiService.register(
//       name: name,
//       email: email,
//       password: password,
//     );

//     setState(() => _isLoading = false);

//     if (success) {
//       if (mounted) {
//         // Sucesso: Volta para a tela de Login
//         Navigator.pop(context); 
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Cadastro realizado com sucesso!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       }
//     } else {
//       // Falha: Exibe mensagem de erro
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Falha ao cadastrar. O email já está em uso ou dados inválidos.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Novo Cadastro'),
//         backgroundColor: AppColors.backgroundColor,
//       ),
//       backgroundColor: AppColors.backgroundColor,
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const Text(
//                 'Criar Nova Conta',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.mainColor,
//                 ),
//               ),
//               const SizedBox(height: 32),

//               // Campo de Nome
//               TextField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Nome Completo',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Campo de Email
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.email),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Campo de Senha
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Senha',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               const SizedBox(height: 32),

//               // Botão de Cadastrar
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _handleRegister,
//                   child: _isLoading
//                       ? const CircularProgressIndicator(color: Colors.black)
//                       : const Text(
//                           'Cadastrar',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Botão Voltar
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text(
//                   'Voltar para Login',
//                   style: TextStyle(color: AppColors.mainColor),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }