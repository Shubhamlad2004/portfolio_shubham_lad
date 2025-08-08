import 'package:flutter/material.dart';
import './social_menu_items.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (currentRoute != '/') {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      height: 28,
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
                _NavItem("Home", '/', currentRoute),
                _NavItem("Profile", '/profile', currentRoute),
                _NavItem("Projects", '/projects', currentRoute),
                _NavItem("Resume", '/resume', currentRoute),
                _NavItem("Content", '/content', currentRoute),
                const _ContactDropdown(),
              ] else ...[
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.maybeOf(context)?.openEndDrawer();
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final String route;
  final String? currentRoute;

  const _NavItem(this.label, this.route, this.currentRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentRoute == route;

    return TextButton(
      onPressed: () {
        if (!isSelected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              decoration: isSelected ? TextDecoration.underline : null,
            ),
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
      itemBuilder: (context) => SocialMenuItems.getMenuItems(),
      onSelected: (value) => SocialMenuItems.launchFromValue(value),
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
