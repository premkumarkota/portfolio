import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      endDrawer: _StyledDrawer(
        onScrollTo: _scrollTo,
        keys: {
          "Home": _homeKey,
          "About": _aboutKey,
          "Skills": _skillsKey,
          "Experience": _experienceKey,
          "Projects": _flashApiKey,
          "Contact": _contactKey,
        },
      ),
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
        ],
      ),
    );
  }
}

class _StyledDrawer extends StatelessWidget {
  final Function(GlobalKey) onScrollTo;
  final Map<String, GlobalKey> keys;

  const _StyledDrawer({required this.onScrollTo, required this.keys});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.85,
      child: GlassContainer(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
        color: AppColors.background,
        opacity: 0.8, // Slightly more opaque to ensure contrast
        blur: 20,
        border: Border(
          left: BorderSide(color: AppColors.secondary.withOpacity(0.3)),
          top: BorderSide(color: Colors.white.withOpacity(0.1)),
          bottom: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.secondary,
                    size: 30,
                  ),
                ),
              ),
            ),

            // Menu Items
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: keys.entries.map((entry) {
                      int index = keys.keys.toList().indexOf(entry.key);
                      return FadeInRight(
                        delay: Duration(milliseconds: 100 + (index * 100)),
                        child: _DrawerItem(
                          number: "0${index + 1}.",
                          title: entry.key,
                          onTap: () {
                            Navigator.pop(context);
                            onScrollTo(entry.value);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // Footer
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "© 2026 Prem Kumar Kota",
                  style: GoogleFonts.firaCode(
                    color: AppColors.textSecondary.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatefulWidget {
  final String number;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.number,
    required this.title,
    required this.onTap,
  });

  @override
  State<_DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<_DrawerItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.number,
                style: GoogleFonts.firaCode(
                  color: AppColors.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  color: _isHovered ? Colors.white : AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
