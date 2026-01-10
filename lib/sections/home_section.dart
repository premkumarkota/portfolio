import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:animate_do/animate_do.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            child: Text(
              "Hello, I'm",
              style: GoogleFonts.inter(
                fontSize: 20,
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeInLeft(
            child: Text(
              AppConstants.name,
              style: GoogleFonts.inter(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                height: 1.1,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          FadeInRight(
            child: Text(
              AppConstants.designation,
              style: GoogleFonts.inter(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                height: 1.1,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 30),
          FadeInUp(
            child: SizedBox(
              width: 600,
              child: Text(
                AppConstants.about,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  height: 1.6,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(4),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "Check out my work",
                  style: GoogleFonts.firaCode(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
