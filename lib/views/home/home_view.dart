import 'package:flutter/material.dart';
import 'package:frontend/views/home/calculate_path_button.dart';
import 'package:frontend/views/home/fetch_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>>? stations = [];
  Set<String> shortestPathSet = {};

  @override
  void initState() {
    super.initState();
    _loadStations();
  }

  Future<void> _loadStations() async {
    final loadedStations = await fetchAllStations();
    setState(() {
      stations = loadedStations;
    });
  }

  Future<void> _calculatePath(String startStation, String endStation) async {
    try {
      final path = await calculateShortestPath(startStation, endStation);
      print('shortest path: $path');

      setState(() {
        shortestPathSet = Set.from(path);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Home"),
      ),
      body: stations != null
          ? Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(children: [
                CalculatePathButton(calculateFuntion: _calculatePath)
              ]),
            )
          : const CircularProgressIndicator(),
    );
  }
}
