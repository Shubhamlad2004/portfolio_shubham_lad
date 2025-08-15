import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).dividerTheme.color),
            child: Text('Navigation', style: Theme.of(context).textTheme.titleLarge,),
          ),
          _buildDrawerItem(context, 'Home', '/'),
          _buildDrawerItem(context, 'Profile', '/profile'),
          _buildDrawerItem(context, 'Projects', '/projects'),
          _buildDrawerItem(context, 'Resume', '/resume'),
          _buildDrawerItem(context, 'Content', '/content'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // close drawer
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
