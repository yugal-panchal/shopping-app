import 'package:flutter/material.dart';
import 'package:seek_assesment/views/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seek Assesment',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const DashboardScreen(),
    );
  }
}
