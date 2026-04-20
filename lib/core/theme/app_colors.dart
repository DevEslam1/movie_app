import 'package:flutter/material.dart';

class AppColors {
  // Foundation (Surface)
  static const Color surface = Color(0xFF060E20);
  static const Color surfaceContainerLow = Color(0xFF091328);
  static const Color surfaceContainer = Color(0xFF0F1930);
  static const Color surfaceContainerHigh = Color(0xFF141F38);
  static const Color surfaceContainerHighest = Color(0xFF192540);

  // Accents (Primary)
  static const Color primary = Color(0xFF39B8FD);
  static const Color primaryContainer = Color(0xFF1FAAEF);
  static const Color secondary = Color(0xFF48ACFF);
  static const Color tertiary = Color(0xFFA9A0FF);

  // Content (On Surface)
  static const Color onSurface = Color(0xFFDEE5FF);
  static const Color onSurfaceVariant = Color(0xFFA3AAC4);
  static const Color outline = Color(0xFF6D758C);
  static const Color outlineVariant = Color(0xFF40485D);

  // Status
  static const Color error = Color(0xFFFFB4AB);
  static const Color warning = Color(0xFFFFB900);
  static const Color success = Color(0xFF00D1FF);
  static const Color rating = Color(0xFFFFB800);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient surfaceGradient = LinearGradient(
    colors: [surface, surfaceContainerHighest],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient movieCardOverlay = LinearGradient(
    colors: [Colors.transparent, surface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
