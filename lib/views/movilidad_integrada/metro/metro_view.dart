import 'package:flutter/material.dart';
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
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: [
            DashboardItem(
              imagePath: 'assets/Metro/Linea_1/linea_1.png',
              title: 'Línea 1',
              onTap: () {
                context.goNamed("subMetroL1");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_2/linea_2.png',
              title: 'Línea 2',
              onTap: () {
                context.goNamed("subMetroL2");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_3/linea_3.png',
              title: 'Línea 3',
              onTap: () {
                context.goNamed("subMetroL3");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_4/linea_4.png',
              title: 'Línea 4',
              onTap: () {
                context.goNamed("subMetroL4");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_5/linea_5.png',
              title: 'Línea 5',
              onTap: () {
                context.goNamed("subMetroL5");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_6/linea_6.png',
              title: 'Línea 6',
              onTap: () {
                context.goNamed("subMetroL6");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_7/linea_7.png',
              title: 'Línea 7',
              onTap: () {
                context.goNamed("subMetroL7");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_8/linea_8.png',
              title: 'Línea 8',
              onTap: () {
                context.goNamed("subMetroL8");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_9/linea_9.png',
              title: 'Línea 9',
              onTap: () {
                context.goNamed("subMetroL9");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_A/linea_a.png',
              title: 'Línea A',
              onTap: () {
                context.goNamed("subMetroLA");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_B/linea_b.png',
              title: 'Línea B',
              onTap: () {
                context.goNamed("subMetroLB");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metro/Linea_12/linea_12.png',
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
