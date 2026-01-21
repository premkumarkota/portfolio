import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

import 'package:portfolio/widgets/glass_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Categorize skills manually for better presentation (Mock logic)
    // In a real app, this should come from a model.
    // Categorize skills manually based on user request
    final frontendSkills = ["Flutter", "Dart"];
    final backendSkills = ["FastAPI", "REST APIs"];
    final languageSkills = ["Python", "SQL"];
    final databaseSkills = ["MySQL", "PostgreSQL"];
    final toolSkills = ["GitHub", "GitLab", "VS Code"];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            child: Text(
              "SKILLS & TECHNOLOGIES",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.accent,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeInLeft(
            child: Text(
              "My technical arsenal.",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 60),

          _SkillCategory(
            title: "Frontend Development",
            skills: frontendSkills,
            delay: 0,
          ),
          const SizedBox(height: 40),
          _SkillCategory(
            title: "Backend & Systems",
            skills: backendSkills,
            delay: 200,
          ),
          const SizedBox(height: 40),
          _SkillCategory(
            title: "Programming Languages",
            skills: languageSkills,
            delay: 300,
          ),
          const SizedBox(height: 40),
          _SkillCategory(
            title: "Databases",
            skills: databaseSkills,
            delay: 350,
          ),
          const SizedBox(height: 40),
          if (toolSkills.isNotEmpty)
            _SkillCategory(
              title: "Tools & Others",
              skills: toolSkills,
              delay: 400,
            ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;
  final int delay;

  const _SkillCategory({
    required this.title,
    required this.skills,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          delay: Duration(milliseconds: delay),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: skills.map((skill) {
            return FadeInUp(
              delay: Duration(milliseconds: delay + 100),
              child: _SkillTile(label: skill),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SkillTile extends StatefulWidget {
  final String label;
  const _SkillTile({required this.label});

  @override
  State<_SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<_SkillTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(_isHovered ? 1.05 : 1.0)
          ..translate(0.0, _isHovered ? -5.0 : 0.0),
        child: GlassContainer(
          borderRadius: BorderRadius.circular(12),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          color: _isHovered ? AppColors.secondary : AppColors.cardColor,
          opacity: _isHovered ? 0.2 : 0.05,
          border: Border.all(
            color: _isHovered
                ? AppColors.secondary
                : AppColors.secondary.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.grid_view, // Placeholder icon
                size: 18,
                color: _isHovered ? Colors.white : AppColors.secondary,
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: _isHovered ? Colors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
