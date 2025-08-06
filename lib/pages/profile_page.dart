import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile picture
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your image
              ),
              const SizedBox(height: 20),

              // Name & title
              Text(
                'Shubham Lad',
                style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Student | App Developer | Engineer',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),

              // Short Bio
              Text(
                'I am a Computer Science student at MIT-ADT University with a passion for Flutter development, cloud computing, and solving real-world problems through tech.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Goals
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Goals:',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _GoalItem(text: '🔭 Build innovative, scalable apps.'),
                  _GoalItem(text: '🧠 Constantly learn and grow as a software engineer.'),
                  _GoalItem(text: '🌍 Solve SDG-aligned challenges with technology.'),
                  _GoalItem(text: '🤝 Collaborate with developers and researchers worldwide.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final String text;
  const _GoalItem({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
      ),
    );
  }
}
