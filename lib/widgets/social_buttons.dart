import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0, 
      runSpacing: 0,
      children: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.linkedin),
          onPressed: () {
            _launchURL('https://www.linkedin.com/in/shubhaml2004');
          },
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            _launchURL('mailto:shubhamlad2004@gmail.com');
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.github),
          onPressed: () {
            _launchURL('https://github.com/Shubhamlad2004');
          },
        ),
      ],
    );
  }
}
