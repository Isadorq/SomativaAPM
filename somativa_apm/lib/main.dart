import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/bag_provider.dart';
import 'routes.dart';
import 'core/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BagProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.backgroundDark,
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: appRoutes,
      ),
    );
  }
}
