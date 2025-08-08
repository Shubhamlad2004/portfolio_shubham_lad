import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/projects_page.dart';
import 'pages/resume_page.dart';
import 'pages/content_page.dart';
import 'pages/not_found_page.dart';
import 'theme/app_theme.dart';
// import 'widgets/navbar.dart';
// import 'widgets/footer.dart';
// import 'widgets/responsive_wrapper.dart';
import 'widgets/shared_layout.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shubham Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case '/':
            page = const HomePage();
            break;
          case '/profile':
            page = const ProfilePage();
            break;
          case '/projects':
            page = const ProjectsPage();
            break;
          case '/resume':
            page = const ResumePage();
            break;
          case '/content':
            page = const ContentPage();
            break;
          default:
            page = const NotFoundPage();
        }

        return MaterialPageRoute(
          builder: (_) => SharedLayout(child: page),
          settings: settings,
        );
      },
    );
  }
}
