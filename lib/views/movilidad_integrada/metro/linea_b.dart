import 'package:frontend/services/translation_utils.dart';
import 'package:frontend/services/fetch_data.dart';
import 'package:flutter/material.dart';

class SubMetroLB extends StatefulWidget {
  const SubMetroLB({super.key});

  @override
  State<SubMetroLB> createState() => _SubMetroLBState();
}

class _SubMetroLBState extends State<SubMetroLB> {
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
      return parts.length > 1 && parts[1] == 'LB';
    }).toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0XFF00843D)),
        backgroundColor: const Color(0XFFB1B3B3),
        title: const Text(
          "Metro - Línea B",
          style: TextStyle(
            color: Color(0XFF00843D), // Cambia el color del texto a negro
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
