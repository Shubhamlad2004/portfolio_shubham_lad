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
      endDrawer: const AppDrawer(), // vertical drawer menu bar in case of mobile interface 
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView( // make page scrolable 
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight), // use space horisontaly(helps footer stick to botum)
              child: IntrinsicHeight( // (heavy resource remove if app too slow.) makes colums of same size (as the allest one)
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const NavBar(), // Menu Bar on top
                    ResponsiveWrapper(child: child), // main content
                    const Spacer(), // fill remaining space
                    const CustomFooter(), // shared footer
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
