import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MIView extends StatefulWidget {
  const MIView({super.key});

  @override
  State<MIView> createState() => _MIViewState();
}

class _MIViewState extends State<MIView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Movilidad Integrada CDMX"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.subway,
              color: Colors.indigoAccent,
              size: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "MI - CDMX",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              color: Colors.indigoAccent,
              onPressed: () {
                context.goNamed("subMI");
              },
              child: const Text(
                "Navigate To Sub MI View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
