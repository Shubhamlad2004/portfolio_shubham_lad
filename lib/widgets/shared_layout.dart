import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';
import 'responsive_wrapper.dart';
import 'AppDrawer.dart';

class SharedLayout extends StatelessWidget {
  final Widget child;

  const SharedLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(), // ✅ use modular drawer
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const NavBar(), // ✅ top navigation
                    ResponsiveWrapper(child: child), // ✅ main content
                    const Spacer(), // ✅ fills remaining space
                    const CustomFooter(), // ✅ shared footer
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
