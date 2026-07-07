import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/theme_provider.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/admin_product/presentation/screens/add_product_screen.dart';
import 'package:nti_ecommerce_team4/main_screen.dart';
import 'package:provider/provider.dart';

import 'features/products/presentation/screens/product_details_screen.dart';


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
      themeMode: themeProvider.themeMode,
      home:  const AddProductPage(),
      routes: {
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
