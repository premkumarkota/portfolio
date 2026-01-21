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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            child: Row(
              children: [
                Text(
                  "04. Experience",
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
          ),
          const SizedBox(height: 50),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppConstants.experiences.length,
            itemBuilder: (context, index) {
              final exp = AppConstants.experiences[index];
              return FadeInLeft(
                delay: Duration(milliseconds: index * 200),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Timeline Line
                        Column(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: AppColors.secondary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 2,
                                color: AppColors.secondary.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        // Experience Card
                        Expanded(child: _ExperienceCard(exp: exp)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceModel exp;
  const _ExperienceCard({required this.exp});

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..translate(_isHovered ? 10.0 : 0.0, 0.0),
        child: GlassContainer(
          borderRadius: BorderRadius.circular(16),
          padding: const EdgeInsets.all(30),
          opacity: _isHovered ? 0.08 : 0.03,
          border: Border.all(
            color: _isHovered
                ? AppColors.secondary.withOpacity(0.5)
                : Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  fontSize: 16,
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
                              height: 1.6,
                              fontSize: 16,
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
    );
  }
}
