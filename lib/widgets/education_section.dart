import 'package:flutter/material.dart';
import '../widgets/skills_section.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 720;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Education",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // First Education Item
        _EducationItem(
          title: "Bachelor in Computer Science",
          subtitle: "MIT ADT School of Computing, Pune",
          duration: "2023 - 2026",
          grade: "CGPA : 6.73 / 10",
          skills: [
            "Flutter",
            "Cloud Computing",
            "Machine Learning",
            "Git & GitHub"
          ],
          isMobile: isMobile,
        ),
        const SizedBox(height: 20),

        // Second Education Item
        _EducationItem(
          title: "Diploma in Information and Technology",
          subtitle: "Jayawantrao Sawant Polytechnic",
          duration: "2020 - 2023",
          grade: "Aggregate Percentage : 73.50%",
          skills: [
            "C Programming",
            "Java",
            "Networking Basics",
            "Database Management"
          ],
          isMobile: isMobile,
        ),
      ],
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String title, subtitle, duration, grade;
  final List<String> skills;
  final bool isMobile;

  const _EducationItem({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.grade,
    required this.skills,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEducationDetails(theme),
                const SizedBox(height: 12),
                SkillsSection(skills: skills),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildEducationDetails(theme),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SkillsSection(skills: skills),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildEducationDetails(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 2),
        Text(duration, style: theme.textTheme.bodySmall),
        const SizedBox(height: 2),
        Text(grade, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
