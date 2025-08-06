import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resume',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Download my latest resume and explore my skills, experience, and projects in detail.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // const ResumeButton(resumeUrl: 'link'),  
              const SizedBox(height: 32),

              // Optional: Add key highlights (like a mini bio)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 12,
                children: const [
                  _HighlightBox(
                      icon: Icons.school,
                      text: 'B.Tech CSE, MIT-ADT University'),
                  _HighlightBox(
                      icon: Icons.code,
                      text: 'Flutter, Firebase, Dart, Python'),
                  _HighlightBox(
                      icon: Icons.engineering,
                      text: 'Projects in SDG, IoT, ML, App Dev'),
                  _HighlightBox(
                      icon: Icons.lightbulb,
                      text: 'Passionate about solving real-world problems'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HighlightBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HighlightBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
