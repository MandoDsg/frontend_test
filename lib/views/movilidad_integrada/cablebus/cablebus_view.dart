import 'package:frontend/widgets/dashboard_item.dart';
import 'package:go_router/go_router.dart';
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
        backgroundColor: const Color(0XFF4DC4E1),
        title: const Text("Cablebús"),
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: [
            DashboardItem(
              imagePath: 'assets/dashboard/cb_linea_1.png',
              title: 'Línea 1',
              onTap: () {
                context.goNamed("subCablebusL1");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/cb_linea_2.png',
              title: 'Línea 2',
              onTap: () {
                context.goNamed("subCablebusL2");
              },
            ),
          ],
        ),
      ),
    );
  }
}
