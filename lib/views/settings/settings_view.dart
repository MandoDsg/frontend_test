import 'package:frontend/theme/theme.dart';
import 'package:frontend/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Settings"),
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
                size: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Ajustes",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Ajusta el valor para redondear los bordes
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Color del borde
                      width: 1.5, // Ancho del borde
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.background,
                          blurRadius: 5)
                    ]),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.dark_mode,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text("Dark Mode", style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 100),
                      Consumer<ThemeProvider>(
                        builder: (context, themeProvider, _) {
                          return Transform.scale(
                            scale:
                                1.3, // Ajusta este valor para cambiar el tamaño del Switch
                            child: Switch(
                              value: themeProvider.themeData == darkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme();
                              },
                              activeTrackColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
