import 'package:flutter/material.dart';
import 'package:frontend/services/translation_utils.dart';
import 'package:frontend/services/fetch_data.dart';

class SubMetrobusL3 extends StatefulWidget {
  const SubMetrobusL3({Key? key}) : super(key: key);

  @override
  State<SubMetrobusL3> createState() => _SubMetrobusL3State();
}

class _SubMetrobusL3State extends State<SubMetrobusL3> {
  late Future<List<Map<String, dynamic>>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF7B9B00),
        title: const Text("Metrobús - Línea 3"),
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No hay datos disponibles.'),
            );
          } else {
            final stationData = snapshot.data!;
            final filteredStations = stationData.where((station) {
              final stationName = station['name'];
              final parts = stationName.split('_');
              return parts.length > 1 && parts[1] == 'MBL3';
            }).toList();

            return ListView.builder(
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
            );
          }
        },
      ),
    );
  }
}
