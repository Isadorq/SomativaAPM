import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:somativa_apm/data/restaurant_data.dart';
import 'package:somativa_apm/provider/bag_provider.dart';
import 'package:somativa_apm/ui/core/app_theme.dart';
import 'package:somativa_apm/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantData()),
        ChangeNotifierProvider(create: (_) => BagProvider()),
      ],
      child: MaterialApp(
        title: 'Mange Eats',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
