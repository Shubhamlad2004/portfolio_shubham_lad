import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/project_card.dart';

class GitHubProjectsSection extends StatefulWidget {
  const GitHubProjectsSection({super.key});

  @override
  State<GitHubProjectsSection> createState() => _GitHubProjectsSectionState();
}

class _GitHubProjectsSectionState extends State<GitHubProjectsSection> {
  List<dynamic> _projects = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    final url = Uri.parse('https://api.github.com/users/Shubhamlad2004/repos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _projects = data;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      debugPrint('Failed to load GitHub projects: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: _projects.map((project) {
            final name = project['name'];
            final desc = project['description'] ?? 'No description provided.';
            final url = project['html_url'];
            final imageUrl = 'https://raw.githubusercontent.com/Shubhamlad2004/$name/main/example.png';

            return ProjectCard(
              name: name,
              description: desc,
              url: url,
              imageUrl: imageUrl,
            );
          }).toList(),
        ),
      ],
    );
  }
}
