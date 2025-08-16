import 'package:flutter/material.dart';
import 'package:portfolio_shubham_lad/widgets/github_projects_section.dart';
import 'package:portfolio_shubham_lad/widgets/education_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Me
          const AboutMeSection(),
          const SizedBox(height: 32),

          // Education
          const EducationSection(),
          const SizedBox(height: 32),

          // Projects
          const ProjectsSection(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('lib/assets/images/hero_image.jpeg'),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'I am a Computer Science student at MIT-ADT University with a passion for Flutter development, cloud computing, and solving real-world problems through tech.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        GitHubProjectsSection(),
      ],
    );
  }
}
