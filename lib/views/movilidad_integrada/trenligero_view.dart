import 'package:flutter/material.dart';

class SubTrenLigero extends StatefulWidget {
  const SubTrenLigero({super.key});

  @override
  State<SubTrenLigero> createState() => _SubTrenLigeroState();
}

class _SubTrenLigeroState extends State<SubTrenLigero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("Tren Ligero"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(
                index.toString(),
              ),
              title: Text("Linea no. $index"),
            ),
          );
        }),
      ),
    );
  }
}
