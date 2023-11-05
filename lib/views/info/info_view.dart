import 'package:flutter/material.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Info"),
      ),
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              color: Colors.deepPurpleAccent,
              size: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Info",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
