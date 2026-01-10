import 'package:flutter/material.dart';
import 'package:portfolio/sections/about_section.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/experience_section.dart';
import 'package:portfolio/sections/flash_api_section.dart';
import 'package:portfolio/sections/home_section.dart';
import 'package:portfolio/sections/projects_section.dart';
import 'package:portfolio/sections/skills_section.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 50),
            _DrawerItem(
              title: "Home",
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_homeKey);
              },
            ),
            _DrawerItem(
              title: "About",
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_aboutKey);
              },
            ),
            _DrawerItem(
              title: "Skills",
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_skillsKey);
              },
            ),
            _DrawerItem(
              title: "Experience",
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_experienceKey);
              },
            ),
            _DrawerItem(
              title: "Projects",
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_flashApiKey);
              },
            ),
            _DrawerItem(
              title: "Contact",
              onTap: () {
                Navigator.pop(context);
                _scrollTo(_contactKey);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.backgroundGradient,
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(key: _homeKey, height: 100), // Offset for navbar
                const HomeSection(),
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

class _DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _DrawerItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
