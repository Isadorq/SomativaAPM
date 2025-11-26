import 'package:flutter/material.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/registration_screen.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/menu_screen.dart';
import 'ui/screens/cart_screen.dart';
import 'ui/screens/checkout_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegistrationScreen(),
  '/home': (context) => HomeScreen(),
  '/menu': (context) => MenuScreen(),
  '/cart': (context) => CartScreen(),
  '/checkout': (context) => CheckoutScreen(),
};
