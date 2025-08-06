import 'package:flutter/material.dart';
import '../widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Portfolio Website',
        'description': 'A personal portfolio built using Flutter Web.',
        'technologies': ['Flutter', 'Dart', 'Firebase'],
        'githubUrl': 'https://github.com/yourrepo',
        'imageUrl': 'https://via.placeholder.com/400',
      },
      {
        'title': 'Math Solver',
        'description': 'Solves M2 & aptitude questions.',
        'technologies': ['Flutter', 'ML', 'API'],
        'githubUrl': 'https://github.com/yourrepo2',
        'imageUrl': 'https://via.placeholder.com/400',
      },
    ];

    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2, // Responsive logic can be added
      //       childAspectRatio: 0.85,
      //       mainAxisSpacing: 16,
      //       crossAxisSpacing: 16,
      //     ),
      //     itemCount: projects.length,
      //     itemBuilder: (context, index) {
      //       final project = projects[index];
      //       return ProjectCard(
      //         title: project['title']!,
      //         description: project['description']!,
      //         technologies: List<String>.from(project['technologies']!),
      //         githubUrl: project['githubUrl']!,
      //         imageUrl: project['imageUrl']!,
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
