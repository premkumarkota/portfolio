import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF304263);
  static const Color secondary = Color(0xFF00C9FF); // Vibrant Cyan for accents
  static const Color background = Color(0xFF0F172A); // Slate 900
  static const Color cardColor = Color(0xFF1E293B); // Slate 800
  static const Color textPrimary = Color(0xFFF1F5F9); // Slate 100
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color accent = Color(0xFF38BDF8); // Sky 400

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00C9FF), Color(0xFF304263)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF1E293B), Color(0xFF253347)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
