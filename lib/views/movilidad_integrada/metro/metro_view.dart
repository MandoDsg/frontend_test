import 'package:flutter/material.dart';
import 'package:frontend/views/movilidad_integrada/maps/metro_map.dart';
import 'package:frontend/widgets/dashboard_item.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor: const Color(0XFFFE4F00),
        title: const Text("Metro"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MetroMap()));
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
              imagePath: 'assets/dashboard/linea_1.png',
              title: 'Línea 1',
              onTap: () {
                context.goNamed("subMetroL1");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_2.png',
              title: 'Línea 2',
              onTap: () {
                context.goNamed("subMetroL2");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_3.png',
              title: 'Línea 3',
              onTap: () {
                context.goNamed("subMetroL3");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_4.png',
              title: 'Línea 4',
              onTap: () {
                context.goNamed("subMetroL4");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_5.png',
              title: 'Línea 5',
              onTap: () {
                context.goNamed("subMetroL5");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_6.png',
              title: 'Línea 6',
              onTap: () {
                context.goNamed("subMetroL6");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_7.png',
              title: 'Línea 7',
              onTap: () {
                context.goNamed("subMetroL7");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_8.png',
              title: 'Línea 8',
              onTap: () {
                context.goNamed("subMetroL8");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_9.png',
              title: 'Línea 9',
              onTap: () {
                context.goNamed("subMetroL9");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_a.png',
              title: 'Línea A',
              onTap: () {
                context.goNamed("subMetroLA");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_b.png',
              title: 'Línea B',
              onTap: () {
                context.goNamed("subMetroLB");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/linea_12.png',
              title: 'Línea 12',
              onTap: () {
                context.goNamed("subMetroL12");
              },
            ),
          ],
        ),
      ),
    );
  }
}
