import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/widgets/glass_container.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback? onWorkTap;
  final VoidCallback? onContactTap;

  const HomeSection({super.key, this.onWorkTap, this.onContactTap});

  @override
  Widget build(BuildContext context) {
    // Premium centralized layout
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Floating 'pill' label
            FadeInDown(
              child: GlassContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                borderRadius: BorderRadius.circular(100),
                opacity: 0.1,
                child: Text(
                  "👋 HELLO, I AM PREM",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.secondary,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Massive Typography
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Text(
                "BUILDING DIGITAL\nEXPERIENCES",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: _getResponsiveSize(context, 80, 48),
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                  letterSpacing: -2,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Subtitle / Typing
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: SizedBox(
                height: 40,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Mobile • Web • Desktop',
                      textStyle: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: AppColors.textSecondary,
                            letterSpacing: 2,
                          ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      'Flutter Engineer',
                      textStyle: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: AppColors.textSecondary,
                            letterSpacing: 2,
                          ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 60),

            // Buttons
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _PrimaryButton(onTap: onWorkTap),
                  _SecondaryButton(onTap: onContactTap),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getResponsiveSize(
    BuildContext context,
    double desktop,
    double mobile,
  ) {
    return MediaQuery.of(context).size.width > 800 ? desktop : mobile;
  }
}

class _PrimaryButton extends StatefulWidget {
  final VoidCallback? onTap;

  const _PrimaryButton({this.onTap});

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: AppColors.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withOpacity(0.4),
              blurRadius: _isHovered ? 30 : 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: widget.onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            "EXPLORE WORK",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _SecondaryButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.1,
      borderRadius: BorderRadius.circular(100),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        ),
        child: const Text(
          "CONTACT ME",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
