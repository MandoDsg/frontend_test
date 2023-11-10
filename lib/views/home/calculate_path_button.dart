import 'package:flutter/material.dart';
import 'package:frontend/views/home/fetch_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:diacritic/diacritic.dart';
import 'package:frontend/views/home/shortest_path_widget.dart';

class CalculatePathButton extends StatefulWidget {
  final Future<void> Function(String, String) calculateFuntion;
  const CalculatePathButton({super.key, required this.calculateFuntion});

  @override
  State<CalculatePathButton> createState() => _CalculatePathButtonState();
}

class _CalculatePathButtonState extends State<CalculatePathButton> {
  String searchQuery = '';
  bool showStartResults = false;
  bool showEndResults = false;

  List<Map<String, dynamic>>? stations = [];
  List<Map<String, dynamic>>? filteredStations = [];

  TextEditingController startStationController = TextEditingController();
  TextEditingController endStationController = TextEditingController();

  List<String> shortestPath = [];
  Set<String> shortestPathSet = {};

  @override
  void initState() {
    super.initState();

    // Carga los datos de la API JSON
    fetchDataFromAPI().then((data) {
      setState(() {
        stations = data;
        filteredStations = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //Start Station
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: startStationController,
              decoration: InputDecoration(
                hintText: 'Start Station',
                prefixIcon:
                    const Icon(Icons.my_location, color: Colors.redAccent),
                suffixIcon: startStationController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            startStationController.clear();
                          });
                        },
                        child: const Icon(Icons.clear, color: Colors.grey),
                      )
                    : null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.redAccent.shade700, width: 2)),
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                  if (query.isNotEmpty) {
                    filteredStations = searchStations(query);
                    showStartResults = true;
                  } else {
                    filteredStations = [];
                  }
                });
              },
            ),
            suggestionsCallback: (pattern) {
              if (pattern.isNotEmpty) {
                return searchStations(pattern)
                        ?.map((station) => station['name'].toString())
                        .toList() ??
                    [];
              } else {
                return [];
              }
            },
            itemBuilder: (context, suggestion) {
              final station = stations?.firstWhere(
                (station) => station['name'] == suggestion,
                orElse: () => {},
              );
              final imageUrl = station?['imageUrl'];
              const iconSize = 60.0;

              final translatedName = traducirNombre(suggestion);

              return SizedBox(
                height: 60,
                child: ListTile(
                  title: Text(translatedName),
                  leading: imageUrl != null
                      ? Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: iconSize,
                          height: iconSize,
                        )
                      : const Icon(
                          Icons.image,
                          size: iconSize,
                        ),
                ),
              );
            },
            onSuggestionSelected: (suggestion) {
              setState(() {
                startStationController.text = suggestion;
                showStartResults = true;
                searchQuery = suggestion;
              });
            },
            hideOnEmpty: true,
            hideOnLoading: true,
          ),
          const SizedBox(height: 10),
          //EndStation
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: endStationController,
              decoration: InputDecoration(
                hintText: 'End Station',
                prefixIcon: const Icon(Icons.not_listed_location_outlined,
                    color: Colors.redAccent),
                suffixIcon: endStationController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            endStationController.clear();
                          });
                        },
                        child: const Icon(Icons.clear, color: Colors.grey),
                      )
                    : null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.redAccent.shade700, width: 2)),
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                  if (query.isNotEmpty) {
                    filteredStations = searchStations(query);
                    showStartResults = true;
                  } else {
                    filteredStations = [];
                  }
                });
              },
            ),
            suggestionsCallback: (pattern) {
              if (pattern.isNotEmpty) {
                return searchStations(pattern)
                        ?.map((station) => station['name'].toString())
                        .toList() ??
                    [];
              } else {
                return [];
              }
            },
            itemBuilder: (context, suggestion) {
              final station = stations?.firstWhere(
                (station) => station['name'] == suggestion,
                orElse: () => {},
              );
              final imageUrl = station?['imageUrl'];
              const iconSize = 60.0;

              final translatedName = traducirNombre(suggestion);

              return SizedBox(
                height: 60,
                child: ListTile(
                  title: Text(translatedName),
                  leading: imageUrl != null
                      ? Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: iconSize,
                          height: iconSize,
                        )
                      : const Icon(
                          Icons.image,
                          size: iconSize,
                        ),
                ),
              );
            },
            onSuggestionSelected: (suggestion) {
              setState(() {
                endStationController.text = suggestion;
                showEndResults = false;
                searchQuery = suggestion;
              });
            },
            hideOnEmpty: true,
            hideOnLoading: true,
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: MaterialButton(
              color: Colors.redAccent,
              onPressed: () async {
                try {
                  final path = await calculateShortestPath(
                    startStationController.text,
                    endStationController.text,
                  );
                  setState(() {
                    shortestPath = path;
                  });
                } catch (e) {
                  print('Error $e');
                }
              },
              child: const Text(
                'Calculate Shortest Path',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: ShortestPathWidget(shortestPath: shortestPath),
            ),
          )
        ],
      ),
    );
  }

  List<Map<String, dynamic>>? searchStations(String query) {
    if (query.isEmpty) {
      return stations;
    } else {
      return stations?.where((station) {
        final stationName = removeDiacritics(station['name'].toString())
            .toLowerCase(); // Remover acentos y convertir a minúsculas
        final queryWithoutDiacritics = removeDiacritics(query).toLowerCase();
        return stationName.contains(queryWithoutDiacritics);
      }).map((station) {
        return {
          'name': station['name'],
          'imageUrl': station['imageUrl'],
        };
      }).toList();
    }
  }

  String traducirNombre(String nombre) {
    final sustituciones = {
      '_L1': '\nMetro - Línea 1',
      '_L2': '\nMetro - Línea 2',
      '_L3': '\nMetro - Línea 3',
      '_L4': '\nMetro - Línea 4',
      '_L5': '\nMetro - Línea 5',
      '_L6': '\nMetro - Línea 6',
      '_L7': '\nMetro - Línea 7',
      '_L8': '\nMetro - Línea 8',
      '_L9': '\nMetro - Línea 9',
      '_LA': '\nMetro - Línea A',
      '_LB': '\nMetro - Línea B',
      '_L12': '\nMetro - Línea 12',
      '_MBL1': '\nMetroBús - Línea 1',
      '_MBL2': '\nMetroBús - Línea 2',
      '_MBL3': '\nMetroBús - Línea 3',
      '_MBL4': '\nMetroBús - Línea 4',
      '_MBL5': '\nMetroBús - Línea 5',
      '_MBL6': '\nMetroBús - Línea 6',
      '_MBL7': '\nMetroBús - Línea 7',
      '_CBL1': '\nCableBús - Línea 1',
      '_CBL2': '\nCableBús - Línea 2',
      '_TL': '\nTren Ligero',
    };

    final keysToReplace =
        sustituciones.keys.where((clave) => nombre.endsWith(clave)).toList();

    for (final clave in keysToReplace) {
      nombre = nombre.replaceAll(clave, sustituciones[clave]!);
    }

    List<String> partes = nombre.split('_');
    partes = partes
        .map((parte) => parte[0].toUpperCase() + parte.substring(1))
        .toList();
    return partes.join(' ');
  }

  @override
  void dispose() {
    startStationController.dispose();
    endStationController.dispose();
    super.dispose();
  }
}
