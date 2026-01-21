import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/glass_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/widgets/video_widget.dart';

class FlashApiSection extends StatelessWidget {
  const FlashApiSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

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
                  "Featured Project",
                  style: GoogleFonts.firaCode(
                    fontSize: 20,
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
          const SizedBox(height: 40),
          isDesktop
              ? _DesktopLayout(project: AppConstants.flashApiProject)
              : _MobileLayout(project: AppConstants.flashApiProject),
        ],
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final ProjectModel project;
  const _DesktopLayout({required this.project});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GlassContainer(
        padding: const EdgeInsets.all(40),
        opacity: 0.1,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(project.icon, size: 40, color: AppColors.secondary),
                      const SizedBox(width: 16),
                      Text(
                        project.title,
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    project.description,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: project.tools.split(',').map((tool) {
                      return GlassContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        opacity: 0.05,
                        borderRadius: BorderRadius.circular(30),
                        child: Text(
                          tool.trim(),
                          style: GoogleFonts.firaCode(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => launchUrl(Uri.parse(project.link!)),
                        icon: const Icon(Icons.download, color: Colors.white),
                        label: Text(
                          project.linkLabel ?? "View Project",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      if (project.secondaryLink != null) ...[
                        const SizedBox(width: 20),
                        GlassContainer(
                          opacity: 0.05,
                          borderRadius: BorderRadius.circular(8),
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                launchUrl(Uri.parse(project.secondaryLink!)),
                            icon: const Icon(
                              Icons.open_in_new,
                              color: AppColors.secondary,
                            ),
                            label: Text(
                              project.secondaryLinkLabel ?? "View",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide.none,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const VideoWidget(
                  videoUrl: 'assets/videos/flashapi_demo.mp4',
                  isAsset: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final ProjectModel project;
  const _MobileLayout({required this.project});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      opacity: 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(project.icon, size: 40, color: AppColors.secondary),
          const SizedBox(height: 16),
          Text(
            project.title,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            project.description,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: const VideoWidget(
              videoUrl: 'assets/videos/flashapi_demo.mp4',
              isAsset: true,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tools.split(',').map((tool) {
              return GlassContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                opacity: 0.05,
                borderRadius: BorderRadius.circular(30),
                child: Text(
                  tool.trim(),
                  style: GoogleFonts.firaCode(
                    fontSize: 12,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => launchUrl(Uri.parse(project.link!)),
                    icon: const Icon(Icons.download, color: Colors.white),
                    label: Text(
                      project.linkLabel ?? "View Project",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                if (project.secondaryLink != null) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: GlassContainer(
                      opacity: 0.05,
                      borderRadius: BorderRadius.circular(8),
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            launchUrl(Uri.parse(project.secondaryLink!)),
                        icon: const Icon(
                          Icons.open_in_new,
                          color: AppColors.secondary,
                        ),
                        label: Text(
                          project.secondaryLinkLabel ?? "View",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
