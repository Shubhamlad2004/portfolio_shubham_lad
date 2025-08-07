import 'package:flutter/material.dart';
import '../widgets/social_buttons.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Keep footer small
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text stays left
              Text(
                '© 2025 Shubham Lad.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              
              const SocialButtons(),
            ],
          ),
        ),
      ],
    );
  }
}
