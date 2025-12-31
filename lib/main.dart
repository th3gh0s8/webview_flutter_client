import 'package:flutter/material.dart';
import 'package:sklanka_app/utils/splash_screen.dart'; // Make sure this path is correct

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SklankaApp());
}

class SklankaApp extends StatelessWidget {
  const SklankaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SK Lanka',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(), // Reverted to show SplashScreen first
    );
  }
}
