import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "04. What's Next?",
            style: GoogleFonts.firaCode(
              fontSize: 18,
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Get In Touch",
            style: GoogleFonts.inter(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: Text(
              "I'm currently looking for new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(4),
            ),
            child: ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse("mailto:${AppConstants.email}"));
              },
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
                "Say Hello",
                style: GoogleFonts.firaCode(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(FontAwesomeIcons.github, AppConstants.github),
              const SizedBox(width: 20),
              _SocialIcon(FontAwesomeIcons.linkedin, AppConstants.linkedin),
              const SizedBox(width: 20),
              // Phone icon can invoke 'tel:'
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.phone,
                  color: AppColors.textSecondary,
                ),
                onPressed: () =>
                    launchUrl(Uri.parse("tel:${AppConstants.phone}")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const _SocialIcon(this.icon, this.url);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: AppColors.textSecondary),
      onPressed: () => launchUrl(Uri.parse(url)),
      hoverColor: AppColors.secondary.withOpacity(0.1),
    );
  }
}
