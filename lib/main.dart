import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/network/dio_helper.dart';
import 'package:nti_ecommerce_team4/core/theme/theme_provider.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

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
      home: const LoginScreen(),
    );
  }
}
