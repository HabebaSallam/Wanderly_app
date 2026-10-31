import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'destination.dart';
import 'flag_image.dart';
import 'destination_web_screen.dart';

class DestinationsScreen extends StatefulWidget {
  const DestinationsScreen({super.key});

  @override
  State<DestinationsScreen> createState() =>
      _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  List<Destination> destinations = [];

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      final response = await Dio().get(
        'https://countries.dev/countries?fields=name,capital,region,population,alpha2Code',
      );

      final List data = response.data as List;

      final result = data
          .map(
            (element) => Destination.fromJson(
          element as Map<String, dynamic>,
        ),
      )
          .toList();

      setState(() {
        destinations = result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
      ),
      body: destinations.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final d = destinations[index];

          return ListTile(
            leading: FlagImage(url: d.flagUrl),
            title: Text(d.name),
            subtitle: Text(
              '${d.capital} • ${d.region} • Population: ${d.population}',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationWebScreen(
                    name: d.name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}