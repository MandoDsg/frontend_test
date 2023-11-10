import 'package:flutter/material.dart';

class ShortestPathWidget extends StatelessWidget {
  final List<String> shortestPath;

  const ShortestPathWidget({super.key, required this.shortestPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (shortestPath.isNotEmpty)
            const Text(
              'Shortest Path:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: shortestPath
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.blue,
                          child: Text(
                            (entry.key + 1).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(entry.value),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          if (shortestPath.isEmpty)
            const Text(
              'No path available.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }
}
