import 'package:flutter/material.dart';
import 'package:frontend/services/translation_utils.dart';
import 'package:frontend/services/fetch_data.dart';

class SubMetroL5 extends StatefulWidget {
  const SubMetroL5({Key? key}) : super(key: key);

  @override
  State<SubMetroL5> createState() => _SubMetroL5State();
}

class _SubMetroL5State extends State<SubMetroL5> {
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras espera.
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si algo sale mal.
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos.
            return const Center(
              child: Text('No hay datos disponibles.'),
            );
          } else {
            // Muestra la lista de estaciones una vez que se reciben los datos.
            final stationData = snapshot.data!;
            final filteredStations = stationData.where((station) {
              final stationName = station['name'];
              final parts = stationName.split('_');
              return parts.length > 1 && parts[1] == 'L5';
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
