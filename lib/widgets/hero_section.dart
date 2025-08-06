import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main Row: Text + Image
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left: Text
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Hello, I’m Shubham Lad 😄',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),

                    // Subtitle / Description
                    Text(
                      'A passionate software engineer and application developer currently studying at MIT ADT.\n'
                      'I specialize in creating elegant and efficient solutions to complex problems.\n'
                      'Welcome to my digital space!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 30),

                    // Buttons
                    Wrap(
                      spacing: 8, 
                      runSpacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to Projects
                          },
                          child: const Text('My Projects'),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: () {
                            // Navigate to Contact
                          },
                          child: const Text('Contact Me'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Right: Image
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage(
                    'lib/assets/images/hero_image.jpeg', // replace with your image path
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
