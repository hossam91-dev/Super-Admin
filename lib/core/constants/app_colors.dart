import 'package:flutter/material.dart';

class AppColors {
  // ── Surfaces ──────────────────────────────────────────────
  /// Main scaffold background
  static const Color surface = Color(0xFFF7F9FB);
  /// Lowest container – white cards / inputs
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  /// Low container – section grouping
  static const Color surfaceContainerLow = Color(0xFFF2F4F6);
  /// Container – chips, badges
  static const Color surfaceContainer = Color(0xFFECEEF0);
  /// High container
  static const Color surfaceContainerHigh = Color(0xFFE6E8EA);
  /// Highest container
  static const Color surfaceContainerHighest = Color(0xFFE0E3E5);

  // ── Primary (Indigo) ──────────────────────────────────────
  static const Color primary = Color(0xFF4648D4);
  static const Color primaryContainer = Color(0xFF6063EE);
  static const Color primaryFixed = Color(0xFFE1E0FF);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // ── Text ──────────────────────────────────────────────────
  static const Color onSurface = Color(0xFF191C1E);
  static const Color onSurfaceVariant = Color(0xFF464554);
  static const Color outline = Color(0xFF767586);
  static const Color outlineVariant = Color(0xFFC7C4D7);

  // ── Semantic ──────────────────────────────────────────────
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color success = Color(0xFF1C8C5E);
  static const Color successContainer = Color(0xFFD1FAE5);
  static const Color warning = Color(0xFFB45309);
  static const Color warningContainer = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF4648D4);
  static const Color infoContainer = Color(0xFFE1E0FF);

  // ── Legacy aliases (backward compat during migration) ─────
  static const Color background = surface;
  static const Color white = surfaceContainerLowest;
  static const Color fieldBackground = surfaceContainerLow;
  static const Color fieldBorder = outlineVariant;
  static const Color textDark = onSurface;
  static const Color textMuted = onSurfaceVariant;
  static const Color surfaceVariant = surfaceContainerHigh;
  static const Color redLight = errorContainer;
  static const Color orangeLight = warningContainer;
  static const Color greenLight = successContainer;
}

