import 'package:flutter/material.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 600 ? 12.0 : 24.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 12),
          child: child,
        ),
      ),
    );
  }
}
