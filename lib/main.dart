import 'package:flutter/material.dart';

import 'features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const AureaApp());
}

class AureaApp extends StatelessWidget {
  const AureaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
