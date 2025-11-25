// // lib/screens/login_screen.dart

// import 'package:somativa_apm/ui/core/app_colors.dart';
// import 'package:somativa_apm/ui/widgets/home/home_Screen.dart'; // Tela de destino
// import 'package:somativa_apm/services/api_service.dart'; // O serviço de conexão com o Django
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // 1. Controladores para capturar o texto digitado
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final ApiService _apiService = ApiService(); 
//   bool _isLoading = false; // Controla o estado de carregamento do botão

//   // Função que será chamada ao clicar em "Entrar"
//   Future<void> _handleLogin() async {
//     // Liga o loading
//     setState(() => _isLoading = true);

//     final email = _emailController.text;
//     final password = _passwordController.text;

//     // 2. Chama a função de login no ApiService
//     final success = await _apiService.login(email: email, password: password);
    
//     // Desliga o loading
//     setState(() => _isLoading = false);

//     if (success) {
//       // 3. Login bem-sucedido: Navega para a Home Screen
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeScreen()),
//         );
//       }
//     } else {
//       // 4. Falha no Login: Mostra mensagem de erro
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Credenciais inválidas. Tente novamente.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               // Logo (se estiver na pasta assets)
//               Image.asset('assets/logo.png', height: 120),
//               const SizedBox(height: 48),

//               const Text(
//                 'Acesso de Clientes',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.mainColor,
//                 ),
//               ),
//               const SizedBox(height: 32),

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
//                 obscureText: true, // Esconde a senha
//                 decoration: const InputDecoration(
//                   labelText: 'Senha',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               const SizedBox(height: 32),

//               // Botão de Entrar
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _handleLogin, // Desabilita se estiver carregando
//                   child: _isLoading
//                       ? const CircularProgressIndicator(color: Colors.black) // Mostra loading
//                       : const Text(
//                           'Entrar',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // Link para Cadastro (Requisito B)
//               TextButton(
//                 onPressed: () {
//                   // 🎯 Você deve implementar a RegistrationScreen aqui!
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Ainda precisa implementar a tela de Cadastro!')),
//                   );
//                 },
//                 child: const Text(
//                   'Ainda não tem conta? Cadastre-se.',
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