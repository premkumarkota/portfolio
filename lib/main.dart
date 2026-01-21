import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prem Kumar Kota | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            AppColors.secondary.withOpacity(0.5),
          ),
          trackColor: MaterialStateProperty.all(AppColors.cardColor),
        ),
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.cardColor,
          background: AppColors.background,
        ),
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: AppColors.textPrimary,
            displayColor: AppColors.textPrimary,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
