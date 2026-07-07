import 'package:flutter/material.dart';

/// ==========================================================
/// AppColors
/// كل الألوان اللي في تصميم الفيجما، مقسّمة Light / Dark
/// الأسماء دلالية (semantic) عشان تعرف تستخدم اللون الصح
/// في المكان الصح من غير ما تفكر في الـ hex value
/// ==========================================================
class AppColors {
  AppColors._();

  // ---------- اللون الأساسي (ثابت في الوضعين) ----------
  static const gold = Color(0xFFD4AF37);
  static const goldSoft = Color(
    0x1AD4AF37,
  ); // gold بشفافية 10% (خلفية الأيقونات)

  // ---------- Light Mode ----------
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF8F7F4); // خلفية الكروت
  static const lightSurfaceAlt = Color(0xFFFAF7ED); // خلفية الأيقونة الدائرية
  static const lightBorder = Color(0xFFE5E1DC);

  static const lightTextPrimary = Color(0xFF1B1C1C); // نص أساسي/عناوين
  static const lightTextSecondary = Color(0xFF6B7280); // نص ثانوي/وصف
  static const lightTextMuted = Color(0xFF735C00); // نص خافت (زي "Categories")

  static const lightSwitchTrackOff = Color(0xFFE2DFDE);

  // ---------- Dark Mode ----------
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkSurfaceAlt = Color(0xFF2A2A28);
  static const darkBorder = Color(0xFF3A3A3A);

  static const darkTextPrimary = Color(0xFFF5F5F0);
  static const darkTextSecondary = Color(0xFFB0B0AC);
  static const darkTextMuted = Color(0xFFE8C766);

  static const darkSwitchTrackOff = Color(0xFF3A3A3A);

  // ---------- ألوان عامة (مشتركة) ----------
  static const success = Color(0xFF2E7D32);
  static const error = Color(0xFFD32F2F);
  static const white = Color(0xFFFFFFFF);

  static Color? get darkGold => null;
}

/// ==========================================================
/// AppTextStyles
/// أنماط الخطوط زي ما هي متسمّاة في الفيجما (Heading 1/2/3..)
/// بدون لون، عشان اللون يتحدد حسب الـ Theme الحالي وقت الاستخدام
/// ==========================================================
class AppTextStyles {
  AppTextStyles._();

  static const fontFamily = 'Inter';

  static const heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static const heading3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const heading4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static const buttonText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
}

/// ==========================================================
/// AppTheme
/// بيربط الألوان والخطوط مع ThemeData بتاعت فلاتر
/// استخدم AppTheme.light و AppTheme.dark في MaterialApp
/// ==========================================================
class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: AppTextStyles.fontFamily,

    colorScheme: const ColorScheme.light(
      primary: AppColors.gold,
      secondary: AppColors.gold,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
      error: AppColors.error,
      outline: AppColors.lightBorder,
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading1.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      headlineMedium: AppTextStyles.heading2.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      headlineSmall: AppTextStyles.heading3.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      titleMedium: AppTextStyles.heading4.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextSecondary,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.lightTextMuted,
      ),
      labelLarge: AppTextStyles.buttonText.copyWith(color: AppColors.white),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.lightBorder),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.white,
        textStyle: AppTextStyles.buttonText,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      hintStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.lightTextSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.gold),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(AppColors.white),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.gold
            : AppColors.lightSwitchTrackOff,
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.lightTextSecondary,
    ),

    iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: AppTextStyles.fontFamily,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      secondary: AppColors.gold,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      error: AppColors.error,
      outline: AppColors.darkBorder,
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading1.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      headlineMedium: AppTextStyles.heading2.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      headlineSmall: AppTextStyles.heading3.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      titleMedium: AppTextStyles.heading4.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkTextSecondary,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.darkTextMuted,
      ),
      labelLarge: AppTextStyles.buttonText.copyWith(color: AppColors.white),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.darkBorder),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.darkBackground,
        textStyle: AppTextStyles.buttonText,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurfaceAlt,
      hintStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.darkTextSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(AppColors.white),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.gold
            : AppColors.darkSwitchTrackOff,
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.darkTextSecondary,
    ),

    iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
  );
}
