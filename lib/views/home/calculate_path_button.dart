import 'package:flutter/material.dart';
import 'package:frontend/views/home/fetch_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              setState(() {
                startStationController.text = suggestion;
                showStartResults = false;
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
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              setState(() {
                endStationController.text = suggestion;
                showStartResults = false;
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
        final stationName = station['name'].toString();
        return stationName.toLowerCase().contains(query.toLowerCase());
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
