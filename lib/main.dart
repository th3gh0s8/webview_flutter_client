import 'package:flutter/material.dart';
import 'package:sklanka_app/utils/splash_screen.dart';

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
      title: 'Pettah Computers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(), // Corrected to show splash screen first
    );
  }
}
