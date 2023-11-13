import 'package:flutter/material.dart';
import 'package:frontend/services/fetch_data.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:diacritic/diacritic.dart';
import 'package:frontend/services/translation_utils.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Start Station
          const Text("Origen:", style: TextStyle(fontSize: 16)),
          const SizedBox(
            height: 5,
          ),
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: startStationController,
              decoration: InputDecoration(
                hintText: 'Estación Inicial',
                prefixIcon: Icon(Icons.my_location,
                    color: Theme.of(context).colorScheme.primary),
                suffixIcon: startStationController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            startStationController.clear();
                          });
                        },
                        child: Icon(Icons.clear, color: Colors.grey.shade600),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3)),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey.shade600),
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
          const SizedBox(height: 5),
          //EndStation
          const Text("Destino:", style: TextStyle(fontSize: 16)),
          const SizedBox(
            height: 5,
          ),
          TypeAheadField<String>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: endStationController,
              decoration: InputDecoration(
                hintText: 'Estación Final',
                prefixIcon: Icon(Icons.not_listed_location_outlined,
                    color: Theme.of(context).colorScheme.primary),
                suffixIcon: endStationController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            endStationController.clear();
                          });
                        },
                        child: Icon(Icons.clear, color: Colors.grey.shade600),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3)),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey.shade600),
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
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () async {
                      if (startStationController.text.isNotEmpty &&
                          endStationController.text.isNotEmpty) {
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
                      } else {
                        // Si alguno de los campos está vacío, muestra un diálogo
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary, // Color del icono
                                    size: 30.0, // Tamaño del icono
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Espacio entre el icono y el texto
                                  Text('Error',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ],
                              ),
                              content: Text(
                                  'Por favor, ingresa las dos estaciones.',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Calcular La Ruta Más Corta',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  setState(() {
                    shortestPath = [];
                  });
                },
                child: const Text(
                  'Borrar',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),

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

                        bool isFirstTransfer = entry.key == 0;
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
                                          /*const Text('Transborde a: '),
                                          Text(traducirNombreTransborde(
                                              (stationName.split('_')[1]))),*/
                                          Text(
                                              'Transborde a${traducirNombreTransborde(stationName.split('_')[1])}'),
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
