import 'package:flutter/material.dart';

class AppColors {
  // Premium Dark Theme
  static const Color background = Color(0xFF030303); // Deepest Black
  static const Color surface = Color(0xFF121212); // Slightly lighter for cards
  static const Color primary = Color(0xFFFFFFFF); // Pure White for primary text
  static const Color secondary = Color(0xFF8B5CF6); // Electric Violet
  static const Color accent = Color(0xFF00F0FF); // Cyan Neon

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA1A1AA); // Zinc 400
  static const Color textTertiary = Color(0xFF52525B); // Zinc 600

  // Glassmorphism
  static const Color glassBorder = Color(0xFF27272A); // Zinc 800
  static const Color glassBackground = Color(0x1AFFFFFF); // 10% White

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF00F0FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF030303), Color(0xFF121212)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  // Backwards compatibility / Mapped colors
  static const Color cardColor = surface;

  static const LinearGradient backgroundGradient = darkGradient;

  static const LinearGradient cardGradient = LinearGradient(
    colors: [surface, background],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
