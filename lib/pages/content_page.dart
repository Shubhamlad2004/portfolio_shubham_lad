import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Text(
          "This is the Content Page.\nYou can add blogs, articles, or achievements here.",
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
