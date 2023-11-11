import 'package:flutter/material.dart';

class SubCablebus extends StatefulWidget {
  const SubCablebus({super.key});

  @override
  State<SubCablebus> createState() => _SubCablebusState();
}

class _SubCablebusState extends State<SubCablebus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("Cablebús"),
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
