import 'package:frontend/services/translation_utils.dart';
import 'package:frontend/services/fetch_data.dart';
import 'package:flutter/material.dart';

class SubMetroL5 extends StatefulWidget {
  const SubMetroL5({super.key});

  @override
  State<SubMetroL5> createState() => _SubMetroL5State();
}

class _SubMetroL5State extends State<SubMetroL5> {
  List<Map<String, dynamic>> stationData = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI().then((data) {
      setState(() {
        stationData = data;
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredStations = stationData.where((station) {
      final stationName = station['name'];
      final parts = stationName.split('_');
      return parts.length > 1 && parts[1] == 'L5';
    }).toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.amberAccent.shade400,
        title: const Text(
          "Metro - Línea 5",
          style: TextStyle(
            color: Colors.black, // Cambia el color del texto a negro
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: ListView.builder(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          final station = filteredStations[index];
          final stationName = station['name'].split('_').first;
          return ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              traducirNombre(stationName),
              style: const TextStyle(fontSize: 20),
            ),
            leading: Transform.scale(
              scale: 1.5,
              child: Image.asset(station['imageUrl']),
            ),
          );
        },
      ),
    );
  }
}
