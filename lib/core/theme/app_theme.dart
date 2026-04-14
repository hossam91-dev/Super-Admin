import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.surface,
      primaryColor: AppColors.primary,
      fontFamily: 'Inter',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        surfaceContainerLowest: AppColors.surfaceContainerLowest,
        surfaceContainerLow: AppColors.surfaceContainerLow,
        surfaceContainer: AppColors.surfaceContainer,
        surfaceContainerHigh: AppColors.surfaceContainerHigh,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.onSurface),
        titleTextStyle: TextStyle(
          color: AppColors.onSurface,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerLowest,
        elevation: 0,
        shadowColor: Color(0x0A191C1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerLow,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(
          color: AppColors.onSurfaceVariant,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          minimumSize: const Size(double.infinity, 52),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainer,
        selectedColor: AppColors.primary,
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          color: AppColors.onSurface,
          fontSize: 36,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
        ),
        headlineMedium: TextStyle(
          color: AppColors.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
        ),
        headlineSmall: TextStyle(
          color: AppColors.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
        titleLarge: TextStyle(
          color: AppColors.onSurface,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
        titleMedium: TextStyle(
          color: AppColors.onSurface,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
        ),
        titleSmall: TextStyle(
          color: AppColors.onSurface,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
        bodyLarge: TextStyle(
          color: AppColors.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
        ),
        bodyMedium: TextStyle(
          color: AppColors.onSurfaceVariant,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
        ),
        bodySmall: TextStyle(
          color: AppColors.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
        ),
        labelMedium: TextStyle(
          color: AppColors.onSurfaceVariant,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  // Keep old getter name for backward compat
  static ThemeData get darkTheme => lightTheme;
}
