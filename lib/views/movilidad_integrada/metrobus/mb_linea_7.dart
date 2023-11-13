import 'package:frontend/services/translation_utils.dart';
import 'package:frontend/services/fetch_data.dart';
import 'package:flutter/material.dart';

class SubMetrobusL7 extends StatefulWidget {
  const SubMetrobusL7({super.key});

  @override
  State<SubMetrobusL7> createState() => _SubMetrobusL7State();
}

class _SubMetrobusL7State extends State<SubMetrobusL7> {
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
      return parts.length > 1 && parts[1] == 'MBL7';
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF006A35),
        title: const Text("Metrobús - Línea 7"),
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
