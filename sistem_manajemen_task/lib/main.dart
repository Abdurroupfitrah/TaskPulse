import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  runApp(const TaskPulseApp());
}

class TaskPulseApp extends StatelessWidget {
  const TaskPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskPulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  fontFamily: 'Inter',
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF2563EB),
    primary: const Color(0xFF2563EB),
    surface: Colors.white,
  ), // <-- Tutup ColorScheme di sini
  scaffoldBackgroundColor: const Color(0xFFF8FAFC), // <-- Taruh di luar ColorScheme
  useMaterial3: true,
),
        
      home: const MainNavigationScreen(),
    );
  }
}