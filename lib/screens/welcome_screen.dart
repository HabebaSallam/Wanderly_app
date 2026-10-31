import 'package:flutter/material.dart';
import 'destinations_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;

  const WelcomeScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.explore,
              size: 80,
            ),

            const SizedBox(height: 24),

            Text(
              'Welcome, $name!',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              'Your next adventure starts here.',
              style: TextStyle(
                fontSize: 16,
                color: colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DestinationsScreen(),
                  ),
                );
              },
              child: const Text('Browse Destinations'),
            ),
          ],
        ),
      ),
    );
  }
}