import 'package:flutter/material.dart';

class DestinationsScreen extends StatelessWidget {

  const DestinationsScreen({super.key});

  static List<Map<String, String>> destinations = [

    {'city': 'Alexandria, Egypt', 'type': 'Beach'},

    {'city': 'Tokyo, Japan', 'type': 'City break'},

    {'city': 'Bali, Indonesia', 'type': 'Beach'},

    {'city': 'Interlaken, Switzerland', 'type': 'Mountain'},

    {'city': 'Lisbon, Portugal', 'type': 'City break'},

  ];

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Explore Destinations'),

      ),

      body: SafeArea(

        child: ListView.builder(

            itemCount: destinations.length,

            itemBuilder: (context, index) {

              final destination = destinations[index];

              return Card(

                child: ListTile(

                  leading: const Icon(Icons.location_on),

                  title: Text(destination['city']!),

                  subtitle: Text(destination['type']!),

                ),

              );

            }

        ),

      ),

    );

  }

}
