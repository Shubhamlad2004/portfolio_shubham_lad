import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/images/logo.png',
                  height: 28, // adjust size as needed
                  width: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  "Shubham Lad",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _NavItem("Home", '/'),
            _NavItem("Profile", '/profile'),
            _NavItem("Projects", '/projects'),
            _NavItem("Resume", '/resume'),
            _NavItem("Content", '/content'),
            _ContactDropdown(),
          ] else ...[
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                ),
              )
            ],
          ],
        ),
      ),
      Divider(),
    ],
    );
  }
}
class _NavItem extends StatelessWidget {
  final String label;
  final String route;

  const _NavItem(this.label, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge, // ← pulls from your theme
      ),
    );
  }
}


class _ContactDropdown extends StatelessWidget {
  const _ContactDropdown();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      tooltip: "Contact Me",
      offset: const Offset(0, 30),
      itemBuilder: (context) => [
        const PopupMenuItem<int>(value: 0, child: Text("LinkedIn")),
        const PopupMenuItem<int>(value: 1, child: Text("Email")),
        const PopupMenuItem<int>(value: 2, child: Text("Instagram")),
        const PopupMenuItem<int>(value: 3, child: Text("Phone")),
      ],
      onSelected: (value) {
        // launchUrl or handle contact logic
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text("Contact Me"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
