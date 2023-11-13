import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(context.namedLocation('Info'));
          },
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Icon(
            Icons.info_outline,
            size: 50,
            color: Theme.of(context).colorScheme.primary,
          )),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goBranch(selectedIndex);
        },
        iconSize: 30,
        activeColor: Colors.white,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.location_on,
            title: 'Ruta',
          ),
          BarItem(
            icon: Icons.directions_subway_sharp,
            title: 'MI',
          ),
          BarItem(
            icon: Icons.settings,
            title: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
