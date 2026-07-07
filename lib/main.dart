import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/app_startup.dart';
import 'package:nti_ecommerce_team4/core/theme/theme_provider.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';
import 'package:provider/provider.dart';

import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const AureaApp(),
    ),
  );
}

class AureaApp extends StatelessWidget {
  const AureaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.themeMode, // ده اللي بيبدّل تلقائي
      home: const SplashScreen(),
    );
  }
}
