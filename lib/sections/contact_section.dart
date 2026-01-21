import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/glass_container.dart';
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
          FadeInDown(
            child: Text(
              "05. What's Next?",
              style: GoogleFonts.firaCode(
                fontSize: 18,
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            child: Text(
              "Get In Touch",
              style: GoogleFonts.inter(
                fontSize: 60,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: SizedBox(
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
          ),
          const SizedBox(height: 50),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: _SocialButtons(),
          ),
        ],
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassContainer(
          borderRadius: BorderRadius.circular(12),
          opacity: 0.1,
          child: ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse("mailto:${AppConstants.email}"));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Say Hello",
              style: GoogleFonts.firaCode(
                color: AppColors.secondary,
                fontSize: 18,
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
            const SizedBox(width: 30),
            _SocialIcon(FontAwesomeIcons.linkedin, AppConstants.linkedin),
            const SizedBox(width: 30),
            _SocialIcon(FontAwesomeIcons.phone, "tel:${AppConstants.phone}"),
          ],
        ),
        const SizedBox(height: 40),
        Text(
          "Designed & Built by ${AppConstants.name}",
          style: GoogleFonts.firaCode(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  const _SocialIcon(this.icon, this.url);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -5.0 : 0.0),
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: _isHovered ? AppColors.secondary : AppColors.textSecondary,
            size: 24,
          ),
          onPressed: () => launchUrl(Uri.parse(widget.url)),
        ),
      ),
    );
  }
}
