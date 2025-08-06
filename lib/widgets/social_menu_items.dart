import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMenuItems {
  static List<PopupMenuItem<int>> getMenuItems() {
    return [
      PopupMenuItem<int>(
        value: 0,
        child: const Text("LinkedIn"),
        onTap: () => _launchURL('https://www.linkedin.com/in/shubhaml2004'),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: const Text("Email"),
        onTap: () => _launchURL('mailto:shubhamlad2004@gmail.com'),
      ),
      PopupMenuItem<int>(
        value: 2,
        child: const Text("GitHub"),
        onTap: () => _launchURL('https://github.com/Shubhamlad2004'),
      ),
    ];
  }

  static Future<void> _launchURL(String url) async {
    await Future.delayed(Duration(milliseconds: 100)); // Prevent onTap crash
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
