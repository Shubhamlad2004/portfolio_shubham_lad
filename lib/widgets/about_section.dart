import 'package:flutter/material.dart';
import 'responsive_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = Theme.of(context).colorScheme.onBackground;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: ResponsiveWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: textTheme.headlineLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'I am Shubham Lad, a passionate Computer Science student who builds innovative tools for engineers and students. From app development to research, I love merging code with creativity.',
              style: textTheme.bodyMedium?.copyWith(
                color: textColor.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
