import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMenuItems {
  static List<PopupMenuEntry<int>> getMenuItems() {
    return const [
      PopupMenuItem<int>(
        value: 0,
        child: Text("LinkedIn"),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: Text("Email"),
      ),
      PopupMenuItem<int>(
        value: 2,
        child: Text("GitHub"),
      ),
    ];
  }

  static Future<void> launchFromValue(int value) async {
    String url;

    switch (value) {
      case 0:
        url = 'https://www.linkedin.com/in/shubhaml2004';
        break;
      case 1:
        url = 'mailto:shubhamlad2004@gmail.com';
        break;
      case 2:
        url = 'https://github.com/Shubhamlad2004';
        break;
      default:
        return;
    }

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
