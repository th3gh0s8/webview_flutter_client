import 'package:flutter/material.dart';
import 'package:naleemiah_erp/utils/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NaleemiahErpApp());
}

class NaleemiahErpApp extends StatelessWidget {
  const NaleemiahErpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naleemiah ERP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(), 
    );
  }
}
