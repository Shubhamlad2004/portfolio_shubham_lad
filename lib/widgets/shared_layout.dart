import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';
import 'responsive_wrapper.dart';
import 'app_drawer.dart';

class SharedLayout extends StatelessWidget {
  final Widget child;
  const SharedLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const NavBar(),
                    Expanded(
                      child: ResponsiveWrapper(child: child),
                    ),

                    const CustomFooter(),
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
