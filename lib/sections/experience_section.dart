import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/glass_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final horizontalPadding = isMobile ? 20.0 : 40.0;
        final verticalPadding = isMobile ? 40.0 : 60.0;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                child: Row(
                  children: [
                    Text(
                      "04. Experience",
                      style: GoogleFonts.firaCode(
                        fontSize: isMobile ? 20 : 24,
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
              ),
              const SizedBox(height: 50),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConstants.experiences.length,
                itemBuilder: (context, index) {
                  final exp = AppConstants.experiences[index];
                  // Calculate offsets
                  final double gap = isMobile ? 15 : 30;
                  final double circleSize = 12;
                  final double circleOffset = 0; // Left alignment
                  final double lineOffset =
                      circleOffset + (circleSize / 2) - 1; // Center of circle
                  final double contentLeftPadding = circleSize + gap;

                  return FadeInLeft(
                    delay: Duration(milliseconds: index * 200),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Stack(
                        children: [
                          // 1. Timeline Line (Stretches to height of stack)
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: lineOffset,
                            width: 2,
                            child: Container(
                              color: AppColors.secondary.withOpacity(0.3),
                            ),
                          ),
                          // 2. Timeline Circle
                          Positioned(
                            top: 0,
                            left: circleOffset,
                            child: Container(
                              width: circleSize,
                              height: circleSize,
                              decoration: const BoxDecoration(
                                color: AppColors.secondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          // 3. Experience Card (Determines Height)
                          Padding(
                            padding: EdgeInsets.only(left: contentLeftPadding),
                            child: _ExperienceCard(
                              exp: exp,
                              isMobile: isMobile,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceModel exp;
  final bool isMobile;
  const _ExperienceCard({required this.exp, required this.isMobile});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.isMobile) {
            setState(() => _isHovered = true);
            Future.delayed(const Duration(milliseconds: 1500), () {
              if (mounted) setState(() => _isHovered = false);
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..translate(_isHovered ? 10.0 : 0.0, 0.0),
          child: GlassContainer(
            borderRadius: BorderRadius.circular(16),
            padding: EdgeInsets.all(widget.isMobile ? 20 : 30),
            opacity: _isHovered ? 0.08 : 0.03,
            border: Border.all(
              color: _isHovered
                  ? AppColors.secondary.withOpacity(0.5)
                  : Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.isMobile)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exp.role,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isHovered
                              ? AppColors.secondary
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.exp.duration,
                        style: GoogleFonts.firaCode(
                          fontSize: 14,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.exp.role,
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: _isHovered
                                ? AppColors.secondary
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        widget.exp.duration,
                        style: GoogleFonts.firaCode(
                          fontSize: 14,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                Text(
                  "@ ${widget.exp.company}",
                  style: GoogleFonts.firaCode(
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: widget.exp.points.map((point) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "▹ ",
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 14,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: GoogleFonts.inter(
                                color: AppColors.textSecondary,
                                height: 1.5,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
