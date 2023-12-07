import 'package:frontend/languages/language_constants.dart';
import 'package:frontend/views/movilidad_integrada/maps/mi_map.dart';
import 'package:frontend/widgets/dashboard_item.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text((translation(context).mi)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MIMap()));
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
              imagePath: 'assets/dashboard/logometro.png',
              title: 'Metro',
              onTap: () {
                context.goNamed("subMetro");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/logometrobus.png',
              title: 'Metrobús',
              onTap: () {
                context.goNamed("subMetrobus");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/logotrenligero.png',
              title: 'Tren Ligero',
              onTap: () {
                context.goNamed("subTrenLigero");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/logocablebus.png',
              title: 'Cablebús',
              onTap: () {
                context.goNamed("subCablebus");
              },
            ),
            DashboardItem(
              imagePath: 'assets/dashboard/logoelinsurgente.png',
              title: 'El Insurgente',
              onTap: () {
                context.goNamed("subElInsurgente");
              },
            ),
          ],
        ),
      ),
    );
  }
}
