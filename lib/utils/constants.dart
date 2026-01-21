import 'package:flutter/material.dart';

class ProjectModel {
  final String title;
  final String description;
  final String tools;
  final String? link;
  final String? linkLabel;
  final String? secondaryLink;
  final String? secondaryLinkLabel;
  final IconData? icon;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tools,
    this.link,
    this.linkLabel,
    this.secondaryLink,
    this.secondaryLinkLabel,
    this.icon,
  });
}

class ExperienceModel {
  final String company;
  final String role;
  final String duration;
  final List<String> points;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.duration,
    required this.points,
  });
}

class AppConstants {
  static const String name = "Prem Kumar Kota";
  static const String designation = "Expert Flutter Developer";
  static const String about =
      "Expert Flutter Developer with 1.8 years of experience architecting enterprise-grade cross-platform applications and publishing developer tools on pub.dev. "
      "Specialized in Dart, Flutter, BLoC pattern, Clean Architecture, and RESTful API integration. "
      "Creator of FlashAPI, a VS Code extension and Flutter plugin automating BLoC code generation from API responses, reducing development time by 70%. "
      "Experienced in delivering scalable solutions across Android, iOS, Windows, Linux, and Web platforms.";

  static const String location = "Hyderabad, Telangana";
  static const String email = "premkumarkota11@gmail.com";
  static const String phone = "+91 8555047334";
  static const String github = "https://github.com/premkumarkota";
  static const String linkedin =
      "https://www.linkedin.com/in/prem-kumar-82b284186/";

  static const List<String> skills = [
    "Flutter",
    "Dart",
    "Python",
    "MySQL",
    "BLoC Pattern",
    "Clean Architecture",
    "RESTful APIs",
    "Firebase",
    "Git",
    "VS Code",
    "Git Lab",
    "CI/CD",
    "",
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      company: "Tectoro Consulting Pvt Ltd",
      role: "Flutter Developer",
      duration: "May 2025 – Present",
      points: [
        "Developed EMM (Enterprise Mobility Management) product features focusing on MDM device management.",
        "Built a secure Files application for enterprise device management with controlled file operations.",
      ],
    ),
    ExperienceModel(
      company: "Anxion Webtech Private Limited",
      role: "Flutter Developer",
      duration: "May 2024 – Apr 2025",
      points: [
        "Built cross-platform mobile applications using Flutter with responsive UI design.",
        "Integrated RESTful APIs, Firebase services (authentication, notifications), Payment SDKs, and Google Maps.",
      ],
    ),
  ];

  static const ProjectModel flashApiProject = ProjectModel(
    title: "FlashAPI – VS Code Extension & Plugin",
    description:
        "A powerful developer tool that automates BLoC clean architecture code generation from REST API responses. It significantly reduces development time by generating models, repositories, and BLoC logic instantly.",
    tools: "VS Code Extension, Flutter Plugin, Dart, TypeScript",
    link: "https://pub.dev/packages/flashapi_generator",
    linkLabel: "Pub.dev",
    secondaryLink:
        "https://marketplace.visualstudio.com/items?itemName=PremKumarKota.flashapi",
    secondaryLinkLabel: "Marketplace",
    icon: Icons.flash_on,
  );

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: "Secure Files MDM Application",
      description:
          "Developed a secure file management application for enterprise device management with MDM/EMM integration. Implemented SQFlite for encrypted local file storage.",
      tools: "Flutter, SQFlite, EMM/MDM",
      icon: Icons.security,
    ),
    ProjectModel(
      title: "Spa Service Booking Application",
      description:
          "End-to-end spa service booking application with Firebase authentication and PayU payment gateway. Integrated Zenoti APIs for outlets and services.",
      tools: "Flutter, PayU, Firebase",
      link:
          "https://play.google.com/store/apps/details?id=com.ridhiragroup.odespa",
      linkLabel: "Play Store",
      icon: Icons.spa,
    ),
    ProjectModel(
      title: "E-commerce Cashback Application",
      description:
          "Developed a cashback application with RESTful API integration for real-time deals and coupons.",
      tools: "Flutter, REST API",
      link:
          "https://play.google.com/store/apps/details?id=com.earn.pond&hl=en_IN",
      linkLabel: "Play Store",
      icon: Icons.shopping_bag,
    ),
    ProjectModel(
      title: "Multi-App Spa Service Booking Platform",
      description:
          "Built a multi-application spa booking platform (user, vendor) with Google Maps for location-based listing and Razorpay for payments.",
      tools: "Flutter, Google Maps, Razorpay",
      link:
          "https://play.google.com/store/apps/details?id=com.esteticaapp.user&hl=en_IN",
      linkLabel: "User App",
      icon: Icons.layers,
    ),
  ];
}
