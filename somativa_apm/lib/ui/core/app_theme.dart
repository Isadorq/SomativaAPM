// lib/ui/_core/app_theme.dart

import 'package:somativa_apm/ui/core/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
   elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(Colors.black),
      backgroundColor: WidgetStateColor.resolveWith((states){
        if(states.contains(WidgetState.disabled)){
          return Colors.grey;
        }else if(
          states.contains(WidgetState.pressed)){
            return const Color.fromARGB(171, 255, 164, 89);
          }
          return AppColors.mainColor;
        }
      ),
    ),
   ),
   // Estilo básico para TextFields
   inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightBackgroundColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: AppColors.mainColor, width: 2.0),
      ),
      labelStyle: const TextStyle(color: Colors.white70),
    ),
  );
}