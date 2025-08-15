import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  Future<void> _openResume(BuildContext context) async {
    final Uri resumeUri = Uri.parse('lib/assets/resume/Shubham_Lad_Resume.pdf');
    if (!await launchUrl(resumeUri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open resume')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;


    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image on top for mobile
                CircleAvatar(
                  radius: 100,
                  backgroundImage: const AssetImage(
                    'lib/assets/images/hero_image.jpeg',
                  ),
                ),
                const SizedBox(height: 30),

                // Text section below image
                _buildTextSection(context, isMobile: true),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text on left
                Expanded(
                  flex: 2,
                  child: _buildTextSection(context),
                ),
                const SizedBox(width: 40),

                // Portrait-style rectangle image on right for desktop
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 3 / 4, // Width : Height (portrait)
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/assets/images/hero_image.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );

  }

  Widget _buildTextSection(BuildContext context, {bool isMobile = false}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Headline
        Text(
          'Hi, I’m Shubham Lad 👋',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 20),

        // Tagline
        Text(
          'Software Engineer | Flutter & Cloud Solutions Developer',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontStyle: FontStyle.italic,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 30),

        // Short bio
        Text(
          'I build fast, scalable, and user-friendly applications that turn ideas into real-world solutions. '
          'Currently pursuing my B.Tech in CSE at MIT ADT University, I specialize in Flutter, Dart, and cloud technologies. '
          'When I’m not coding, you’ll find me playing chess or exploring new tech trends.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 30),

        // Call to action buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/projects');
              },
              child: const Text('View My Projects'),
            ),
            OutlinedButton(  
              onPressed: () => _openResume(context),
              child: const Text('View Resume'),
            ),
          ],
        ),
      ],
    );
  }
}
