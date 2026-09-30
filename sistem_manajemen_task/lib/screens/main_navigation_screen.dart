import 'package:flutter/material.dart';
import '../models/task_item.dart';
import 'dashboard_screen.dart';
import 'settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<TaskItem> _tasks = [
    TaskItem(
      id: '1',
      title: 'Laporan Praktikum JDBC & MySQL',
      priority: 'Tinggi',
      category: 'Pemrograman Berbasis Objek',
      description: 'Membuat laporan perancangan DAO Layer dan Service Layer.',
    ),
    TaskItem(
      id: '2',
      title: 'Analisis IMK Aplikasi Habitica',
      priority: 'Sedang',
      category: 'Interaksi Manusia & Komputer',
      description: 'Menganalisis prinsip Affordance dan Visibility.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(
        tasks: _tasks,
        onTaskToggle: (task) {
          setState(() {
            task.isCompleted = !task.isCompleted;
          });
        },
        onTaskAdded: (newTask) {
          setState(() {
            _tasks.insert(0, newTask);
          });
        },
      ),
      const SettingsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '⚡ TaskPulse',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF2563EB),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}