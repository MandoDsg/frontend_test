import 'package:flutter/material.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:frontend/views/info/pages/info_metro.dart';
import 'package:frontend/views/info/pages/info_metrobus.dart';
import 'package:frontend/views/info/pages/info_mi.dart';
import 'package:frontend/views/info/pages/info_trenligero.dart';
import 'package:frontend/views/info/pages/infro_cablebus.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text((translation(context).info)),
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            indicatorWeight: 3,
            tabs: [
              Tab(
                icon: Image.asset('assets/dashboard/logomi.png'),
              ),
              Tab(
                icon: Image.asset('assets/dashboard/logometro.png'),
              ),
              Tab(
                icon: Image.asset('assets/dashboard/logometrobus.png'),
              ),
              Tab(
                icon: Image.asset('assets/dashboard/logotrenligero.png'),
              ),
              Tab(
                icon: Image.asset('assets/dashboard/logocablebus.png'),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: const TabBarView(children: [
          InfoMI(),
          InfoMetro(),
          InfoMetrobus(),
          InfoTrenLigero(),
          InfoCablebus(),
        ]),
      ),
    );
  }
}
