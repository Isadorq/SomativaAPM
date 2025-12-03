import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/screens/login_screen.dart';
import './ui/screens/registration_screen.dart';
import './ui/screens/menu_screen.dart';
import './ui/screens/checkout_screen.dart';
import './ui/screens/confirmation_screen.dart';
import '../../provider/bag_provider.dart';
import '../ui/screens/restaurant_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BagProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegistrationScreen(),
        "/menu": (context) => const MenuScreen(),
        "/restaurant": (context) => const RestaurantScreen(), 
        "/checkout": (context) => const CheckoutScreen(),
        "/confirmation": (context) => const ConfirmationScreen(),
      },
    );
  }
}
