import 'package:flutter/material.dart';
import 'package:frontend/services/fetch_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:diacritic/diacritic.dart';
import 'package:frontend/views/translation_utils.dart';

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
                height: 65,
                child: ListTile(
                  title: Text(translatedName),
                  leading: imageUrl != null
                      ? Image.asset(
                          imageUrl,
                          //fit: BoxFit.cover,
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
                height: 65,
                child: ListTile(
                  title: Text(translatedName),
                  leading: imageUrl != null
                      ? Image.asset(
                          imageUrl,
                          //fit: BoxFit.cover,
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
              child: shortestPath.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: shortestPath.asMap().entries.map((entry) {
                        final stationName = entry.value;
                        final station = stations?.firstWhere(
                          (station) => station['name'] == stationName,
                          orElse: () => {},
                        );
                        final imageUrl = station?['imageUrl'];
                        final translatedName = traducirNombre(stationName);

                        bool isFirstTransfer = entry.key ==
                            0; // Verificar si es la primera transferencia
                        final isTransfer = entry.key != -0 &&
                            stationName.split('_')[0] !=
                                shortestPath[entry.key - 1].split('_')[0];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              if (isFirstTransfer)
                                Column(children: [
                                  const Text(
                                    'Aborde en:',
                                  ),
                                  Row(
                                    children: [
                                      if (imageUrl != null)
                                        Image.asset(
                                          imageUrl,
                                          width: 60,
                                          height: 60,
                                        ),
                                      const SizedBox(width: 10),
                                      Text(translatedName),
                                    ],
                                  )
                                ])
                              else
                                !isTransfer
                                    ? Column(
                                        children: [
                                          const Text('Transborde a:'),
                                          Row(
                                            children: [
                                              if (imageUrl != null)
                                                Image.asset(
                                                  imageUrl,
                                                  width: 60,
                                                  height: 60,
                                                ),
                                              const SizedBox(width: 10),
                                              Text(translatedName),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          if (imageUrl != null)
                                            Image.asset(
                                              imageUrl,
                                              width: 60,
                                              height: 60,
                                            ),
                                          const SizedBox(width: 10),
                                          Text(translatedName),
                                        ],
                                      ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
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

  @override
  void dispose() {
    startStationController.dispose();
    endStationController.dispose();
    super.dispose();
  }
}
