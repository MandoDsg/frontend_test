import 'package:flutter/material.dart';

class SubMIView extends StatefulWidget {
  const SubMIView({super.key});

  @override
  State<SubMIView> createState() => _SubMIViewState();
}

class _SubMIViewState extends State<SubMIView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Sub MI View"),
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
