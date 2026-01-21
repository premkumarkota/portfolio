import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/glass_container.dart';
import 'package:portfolio/sections/about_section.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/experience_section.dart';
import 'package:portfolio/sections/flash_api_section.dart';
import 'package:portfolio/sections/home_section.dart';
import 'package:portfolio/sections/projects_section.dart';
import 'package:portfolio/sections/skills_section.dart';
import 'package:portfolio/widgets/nav_bar.dart';
import 'package:portfolio/widgets/animated_background.dart';
import 'package:portfolio/utils/video_controller_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Preload the large video immediately
    VideoControllerService().preload(
      'assets/videos/flashapi_demo.mp4',
      isAsset: true,
    );
  }

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _flashApiKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(key: _homeKey, height: 100), // Offset for navbar
                HomeSection(
                  onWorkTap: () => _scrollTo(_flashApiKey),
                  onContactTap: () => _scrollTo(_contactKey),
                ),
                SizedBox(key: _aboutKey, child: const AboutSection()),
                SizedBox(key: _skillsKey, child: const SkillsSection()),
                SizedBox(key: _experienceKey, child: const ExperienceSection()),
                SizedBox(key: _flashApiKey, child: const FlashApiSection()),
                SizedBox(key: _projectsKey, child: const ProjectsSection()),
                SizedBox(key: _contactKey, child: const ContactSection()),
                const SizedBox(height: 100), // Bottom padding
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onHomeTap: () => _scrollTo(_homeKey),
              onAboutTap: () => _scrollTo(_aboutKey),
              onSkillsTap: () => _scrollTo(_skillsKey),
              onExperienceTap: () => _scrollTo(_experienceKey),
              onProjectsTap: () => _scrollTo(_flashApiKey),
              onContactTap: () => _scrollTo(_contactKey),
            ),
          ),
          if (MediaQuery.of(context).size.width < 600)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ), // Small gap from edge
                  child: _MobileNavRail(
                    onScrollTo: _scrollTo,
                    keys: {
                      "Home": _homeKey,
                      "About": _aboutKey,
                      "Skills": _skillsKey,
                      "Experience": _experienceKey,
                      "Projects": _projectsKey,
                      "Contact": _contactKey,
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MobileNavRail extends StatelessWidget {
  final Function(GlobalKey) onScrollTo;
  final Map<String, GlobalKey> keys;

  const _MobileNavRail({required this.onScrollTo, required this.keys});

  IconData _getIcon(String key) {
    switch (key) {
      case "Home":
        return Icons.home_outlined;
      case "About":
        return Icons.person_outline;
      case "Skills":
        return Icons.folder_open_outlined;
      case "Experience":
        return Icons.work_outline;
      case "Projects":
        return Icons.emoji_events_outlined;
      case "Contact":
        return Icons.mail_outline;
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(50),
      color: AppColors.background,
      opacity: 0.1,
      blur: 20,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: keys.entries.map((entry) {
          int index = keys.keys.toList().indexOf(entry.key);
          return FadeInRight(
            delay: Duration(milliseconds: 100 + (index * 100)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: IconButton(
                onPressed: () => onScrollTo(entry.value),
                icon: Icon(
                  _getIcon(entry.key),
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                tooltip: entry.key,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  hoverColor: AppColors.secondary.withOpacity(0.2),
                  highlightColor: AppColors.secondary.withOpacity(0.1),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
