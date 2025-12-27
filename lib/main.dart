import 'package:flutter/material.dart';
import 'package:sklanka_app/screens/webview_screen.dart'; // Import WebViewScreen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SklankaApp());
}

class SklankaApp extends StatelessWidget {
  const SklankaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SK Lanka Holdings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WebViewScreen(), // Set WebViewScreen as home
    );
  }
}
