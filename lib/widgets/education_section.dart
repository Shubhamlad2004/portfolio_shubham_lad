import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Education", style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _EducationItem(
          title: "Bachelor in Computer Science",
          subtitle: "MIT ADT School of Computing, Pune",
          duration: "2023 - 2026",
          grade: "CGPA : 6.73 / 10",
        ),
        const SizedBox(height: 12),
        _EducationItem(
          title: "Diploma in Information and Technology",
          subtitle: "Jayawantrao Sawant Polytechnic",
          duration: "2020 - 2023",
          grade: "Aggregate Percentage : 73.50%",
        ),
      ],
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String title, subtitle, duration, grade;
  const _EducationItem({required this.title, required this.subtitle, required this.duration, required this.grade});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        Text(subtitle, style: theme.textTheme.bodyMedium),
        Text(duration, style: theme.textTheme.bodySmall),
        Text(grade, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
