import 'package:flutter/material.dart';
import 'package:frontend/views/home/fetch_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:diacritic/diacritic.dart';

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
    return SizedBox(
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
          MaterialButton(
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
          SizedBox(
            height: 350, // Establece la altura máxima que desees
            child: SingleChildScrollView(
              child: shortestPath.isNotEmpty
                  ? Text('Shortest Path: \n${shortestPath.join("\n")}')
                  : const SizedBox.shrink(),
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
      '_l1': '\nMetro - Linea 1',
      '_l2': '\nMetro - Linea 2',
      '_l3': '\nMetro - Linea 3',
      '_l4': '\nMetro - Linea 4',
      '_l5': '\nMetro - Linea 5',
      '_l6': '\nMetro - Linea 6',
      '_l7': '\nMetro - Linea 7',
      '_l8': '\nMetro - Linea 8',
      '_l9': '\nMetro - Linea 9',
      '_la': '\nMetro - Linea A',
      '_lb': '\nMetro - Linea B',
      '_l12': '\nMetro - Linea 12',
      '_l1mb': '\nMetroBus - Linea 1',
      '_l2mb': '\nMetroBus - Linea 2',
      '_l3mb': '\nMetroBus - Linea 3',
      '_l4mb': '\nMetroBus - Linea 4',
      '_l5mb': '\nMetroBus - Linea 5',
      '_l6mb': '\nMetroBus - Linea 6',
      '_l7mb': '\nMetroBus - Linea 7',
      '_l1cb': '\nCableBus - Linea 1',
      '_l2cb': '\nCableBus - Linea 2',
      '_l1tl': '\nTren Ligero',
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
