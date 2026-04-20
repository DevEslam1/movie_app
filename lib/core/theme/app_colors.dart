import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF3EB4F0); // Vibrant Light Blue from reference
  static const Color secondary = Color(0xFF1E293B);
  
  // Background/Surface
  static const Color surface = Color(0xFF0D1117); // Deep Navy/Black
  static const Color surfaceContainer = Color(0xFF161B22);
  static const Color surfaceContainerHigh = Color(0xFF21262D);
  
  // Text
  static const Color onSurface = Color(0xFFF0F6FC);
  static const Color onSurfaceVariant = Color(0xFF8B949E);
  
  // Accents
  static const Color accent = Color(0xFF58A6FF);
  static const Color tertiary = Color(0xFF58A6FF);
  static const Color error = Color(0xFFF85149);
  static const Color rating = Color(0xFFFFC107); // Amber color for ratings
  
  // Containers & Outlines
  static const Color primaryContainer = Color(0xFF1E293B);
  static const Color outline = Color(0xFF30363D);
  static const Color outlineVariant = Color(0xFF21262D);
  static const Color surfaceContainerLow = Color(0xFF0D1117);
  static const Color surfaceContainerHighest = Color(0xFF30363D);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF3EB4F0), Color(0xFF1D9BF0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
