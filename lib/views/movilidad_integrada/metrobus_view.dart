import 'package:flutter/material.dart';

class SubMetrobus extends StatefulWidget {
  const SubMetrobus({super.key});

  @override
  State<SubMetrobus> createState() => _SubMetrobus();
}

class _SubMetrobus extends State<SubMetrobus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade400,
        title: const Text("Metrobús"),
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
