import 'package:flutter/material.dart';
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
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Center(
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: [
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_1/linea_1.png',
              title: 'Línea 1',
              onTap: () {
                context.goNamed("subMetrobusL1");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_2/linea_2.png',
              title: 'Línea 2',
              onTap: () {
                context.goNamed("subMetrobusL2");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_3/linea_3.png',
              title: 'Línea 3',
              onTap: () {
                context.goNamed("subMetrobusL3");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_4/linea_4.png',
              title: 'Línea 4',
              onTap: () {
                context.goNamed("subMetrobusL4");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_5/linea_5.png',
              title: 'Línea 5',
              onTap: () {
                context.goNamed("subMetrobusL5");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_6/linea_6.png',
              title: 'Línea 6',
              onTap: () {
                context.goNamed("subMetrobusL6");
              },
            ),
            DashboardItem(
              imagePath: 'assets/Metrobus/Linea_7/linea_7.png',
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
