import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/glass_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth <= 700;
        final horizontalPadding = isMobile ? 20.0 : 40.0;
        final verticalPadding = isMobile ? 40.0 : 80.0;

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
                child: Text(
                  "SELECTED WORK",
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
                  "Stuff I've built.",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    height: 1.2,
                    fontSize: isMobile ? 32 : null,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              if (isMobile)
                Column(
                  children: List.generate(AppConstants.projects.length, (
                    index,
                  ) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: FadeInUp(
                        delay: Duration(milliseconds: index * 100),
                        child: _ProjectCard(
                          project: AppConstants.projects[index],
                          index: index,
                          isMobile: true,
                        ),
                      ),
                    );
                  }),
                )
              else
                _buildGridView(context, constraints),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context, BoxConstraints constraints) {
    int crossAxisCount = 2;
    double childAspectRatio = 0.8;

    if (constraints.maxWidth > 1100) {
      crossAxisCount = 3;
      childAspectRatio = 0.9;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppConstants.projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: index * 100),
          child: _ProjectCard(
            project: AppConstants.projects[index],
            index: index,
            isMobile: false,
          ),
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final int index;
  final bool isMobile;
  const _ProjectCard({
    required this.project,
    required this.index,
    required this.isMobile,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Format number like "01", "02"
    String number = (widget.index + 1).toString().padLeft(2, '0');

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.isMobile) {
            setState(() => isHovered = true);
            Future.delayed(const Duration(milliseconds: 1500), () {
              if (mounted) setState(() => isHovered = false);
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()
            ..translate(0.0, isHovered ? -10.0 : 0.0),
          child: GlassContainer(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.surface, // Use consistent surface color
            opacity: 0.1, // Subtle glass
            padding: const EdgeInsets.all(0),
            border: Border.all(
              color: isHovered
                  ? AppColors.secondary.withOpacity(0.5)
                  : AppColors.glassBorder,
              width: 1,
            ),
            child: Stack(
              children: [
                // 1. Watermark Number
                Positioned(
                  right: 20,
                  top: 10,
                  child: Opacity(
                    opacity: isHovered ? 0.2 : 0.05,
                    child: Text(
                      number,
                      style: TextStyle(
                        fontFamily: 'Inter', // Or standard sans
                        fontSize: 120,
                        fontWeight: FontWeight.w900,
                        color: AppColors.secondary,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),

                // 2. Content
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              widget.project.icon,
                              color: AppColors.secondary,
                              size: 24,
                            ),
                          ),
                          Row(
                            children: [
                              if (widget.project.secondaryLink != null)
                                _LinkBtn(
                                  icon: FontAwesomeIcons.github,
                                  url: widget.project.secondaryLink!,
                                ),
                              const SizedBox(width: 10),
                              if (widget.project.link != null)
                                _LinkBtn(
                                  icon: Icons.open_in_new,
                                  url: widget.project.link!,
                                ),
                            ],
                          ),
                        ],
                      ),

                      if (widget.isMobile)
                        const SizedBox(height: 20)
                      else
                        const Spacer(),

                      // Title
                      Text(
                        widget.project.title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isHovered
                                  ? AppColors.secondary
                                  : AppColors.textPrimary,
                            ),
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Text(
                        widget.project.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Tech Stack
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: widget.project.tools.split(',').map((tool) {
                          return Text(
                            tool.trim(),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.textSecondary.withOpacity(
                                    0.8,
                                  ),
                                  fontFamily:
                                      'FiraCode', // Monospace if available
                                  fontWeight: FontWeight.w500,
                                ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                // 3. Hover Glow at Bottom
                if (isHovered)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(24),
                        ),
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

class _LinkBtn extends StatelessWidget {
  final IconData icon;
  final String url;
  const _LinkBtn({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon, size: 20, color: AppColors.textSecondary),
      hoverColor: AppColors.secondary.withOpacity(0.1),
      style: IconButton.styleFrom(foregroundColor: AppColors.secondary),
    );
  }
}
