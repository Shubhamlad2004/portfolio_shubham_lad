import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class ProjectCard extends StatefulWidget {
  final String name;
  final String description;
  final String url;
  final String imageUrl;

  const ProjectCard({
    super.key,
    required this.name,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  void _launchUrl() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 300,
        height: 200,
        child: Stack(
          children: [
            // BACK SIDE
            AnimatedOpacity(
              opacity: _isHovered ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          widget.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: _launchUrl,
                          child: const Text('View on GitHub'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // FRONT SIDE
            AnimatedOpacity(
              opacity: _isHovered ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'lib/assets/images/project_placeholder.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Center(
                      child: Text(
                        widget.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
