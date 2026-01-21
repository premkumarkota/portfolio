import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/glass_container.dart';
import 'package:animate_do/animate_do.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: isDesktop
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _AboutContent()),
                SizedBox(width: 60),
                Expanded(flex: 4, child: _ProfileImage()),
              ],
            )
          : const Column(
              children: [
                _ProfileImage(),
                SizedBox(height: 50),
                _AboutContent(),
              ],
            ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        FadeInDown(
          child: Text(
            "ABOUT ME",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.accent,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Main Headline
        FadeInLeft(
          child: Text(
            "Transforming ideas into digital reality.",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 30),

        // Bio Text
        FadeInUp(
          child: Text(
            AppConstants.about,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.8,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 40),

        // Stats Grid
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: const Wrap(
            spacing: 30,
            runSpacing: 20,
            children: [
              _StatItem(value: "2+", label: "Years Exp."),
              _StatItem(value: "10+", label: "Projects"),
              _StatItem(value: "2+", label: "Clients"),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _ProfileImage extends StatefulWidget {
  const _ProfileImage();

  @override
  State<_ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<_ProfileImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 350, maxHeight: 400),
          child: AspectRatio(
            aspectRatio: 0.85,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Back Decoration (Outline)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: _isHovered ? 20 : 0,
                  right: _isHovered ? 20 : 0,
                  bottom: _isHovered ? -20 : 0,
                  left: _isHovered ? -20 : 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.secondary, width: 2),
                    ),
                  ),
                ),
                // Front Image (Glass Container placeholder)
                GlassContainer(
                  width: double.infinity,
                  height: double.infinity,
                  borderRadius: BorderRadius.circular(20),
                  opacity: 0.1,
                  color: AppColors.cardColor,
                  child: Center(
                    child: Icon(
                      Icons.person_outline,
                      size: 100,
                      color: AppColors.textSecondary.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
