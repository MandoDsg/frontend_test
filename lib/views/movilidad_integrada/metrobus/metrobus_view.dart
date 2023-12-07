import 'package:flutter/material.dart';
import 'package:frontend/views/movilidad_integrada/maps/metrobus_map.dart';
import 'package:frontend/widgets/dashboard_item.dart';
import 'package:go_router/go_router.dart';

class SubMetrobus extends StatefulWidget {
  const SubMetrobus({super.key});

  @override
  State<SubMetrobus> createState() => _SubMetrobusState();
}

class _SubMetrobusState extends State<SubMetrobus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFC9082A),
        title: const Text("Metrobús"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MetrobusMap()));
              },
              icon: const Icon(Icons.map))
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: [
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_1.png',
              title: 'Línea 1',
              onTap: () {
                context.goNamed("subMetrobusL1");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_2.png',
              title: 'Línea 2',
              onTap: () {
                context.goNamed("subMetrobusL2");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_3.png',
              title: 'Línea 3',
              onTap: () {
                context.goNamed("subMetrobusL3");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_4.png',
              title: 'Línea 4',
              onTap: () {
                context.goNamed("subMetrobusL4");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_5.png',
              title: 'Línea 5',
              onTap: () {
                context.goNamed("subMetrobusL5");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_6.png',
              title: 'Línea 6',
              onTap: () {
                context.goNamed("subMetrobusL6");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/mb_linea_7.png',
              title: 'Línea 7',
              onTap: () {
                context.goNamed("subMetrobusL7");
              },
            ),
          ],
        ),
      ),
    );
  }
}
