import 'package:flutter/material.dart';

class SubMetro extends StatefulWidget {
  const SubMetro({super.key});

  @override
  State<SubMetro> createState() => _SubMetroState();
}

class _SubMetroState extends State<SubMetro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Metro"),
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
