import 'package:flutter/material.dart';

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
