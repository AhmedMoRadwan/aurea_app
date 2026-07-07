import 'package:flutter/material.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';

class AppStartup extends StatelessWidget {
  const AppStartup({super.key});

  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
