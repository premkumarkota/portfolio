import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "00. About Me",
                style: GoogleFonts.firaCode(
                  fontSize: 24,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Divider(color: AppColors.cardColor, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 40),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _AboutText()),
                    const SizedBox(width: 40),
                    const Expanded(flex: 2, child: _ProfileImage()),
                  ],
                )
              : Column(
                  children: [
                    const _ProfileImage(),
                    const SizedBox(height: 40),
                    const _AboutText(),
                  ],
                ),
        ],
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.about,
          style: GoogleFonts.inter(
            fontSize: 18,
            height: 1.6,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Here are a few technologies I've been working with recently:",
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: AppConstants.skills
              .take(6)
              .map(
                (s) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      size: 12,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      s,
                      style: GoogleFonts.firaCode(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.secondary),
        ),
        child: const Center(
          child: Icon(Icons.person, size: 100, color: AppColors.secondary),
        ),
      ),
    );
  }
}
