import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {

  const StartScreen({super.key, required this.onThemeToggle, required String name});

  final VoidCallback onThemeToggle;

  @override

  Widget build(BuildContext context){

    final colors = Theme.of(context).colorScheme;

    return Scaffold(

      backgroundColor: colors.primary,

      body: Center(

        child: Column(

          mainAxisSize: MainAxisSize.min,

          children: [

            CircleAvatar(

              radius: 42,

              backgroundColor: const Color.fromARGB(255, 214, 68, 6),

              child: Icon(Icons.terrain, size:44),

            ),

            const SizedBox(height: 16),

            Text('Wanderly',

              style: TextStyle(

                fontSize: 32,

                fontWeight: FontWeight.bold,

                color: colors.onPrimary,

              ),

            ),

            Text('Explore the world, one city at a time.',

              style: TextStyle(

                fontSize: 16,

                color: colors.onPrimary,

              ),

            ),

            const SizedBox(height: 32),

            ElevatedButton(

              onPressed: () {

                context.push('/signup');

              },

              child: const Text('Start Exploring'),

            ),

            const SizedBox(height: 16),

            TextButton(

              onPressed: onThemeToggle,

              child: Text('Toggle Theme',

                style: TextStyle(

                    color: colors.onPrimary),),

            ),

          ],

        ),

      ),

    );

  }

}
