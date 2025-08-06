import 'package:flutter/material.dart';
import 'package:portfolio_shubham_lad/widgets/skills_section.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/footer.dart';
import '../widgets/about_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onNavItemSelected(String route) {
    // Handle navigation logic here
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight, // Force min height to screen height
              ),
              child: IntrinsicHeight( // Allows Spacer() to work properly
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const NavBar(),
                    const HeroSection(),
                    const SkillsSection(skills: ['Flutter', 'Dart', 'Python', 'Firebase', 'Git', 'Linux'],),
                    const AboutSection(),

                    // You can add ProjectsSection, ContactSection here later

                    const Spacer(), // Pushes Footer to bottom if content is short

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
