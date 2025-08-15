import 'package:flutter/material.dart';
import 'package:portfolio_shubham_lad/widgets/hero_section.dart';
import 'package:portfolio_shubham_lad/widgets/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        HeroSection(),
        SizedBox(height: 32),
        SkillsSection(
          skills: ['Flutter', 'Dart', 'Python', 'Firebase', 'Git', 'Linux'],
        ),
      ],
    );
  }
}
