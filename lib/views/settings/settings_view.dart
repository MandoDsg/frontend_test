import 'package:frontend/languages/language.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:frontend/main.dart';
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
        title: Text(translation(context).settings),
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
              Text(
                (translation(context).settings),
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 100,
              ),
              //! Dark Mode
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.background,
                          blurRadius: 5)
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
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
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text((translation(context).darkmode),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Consumer<ThemeProvider>(
                          builder: (context, themeProvider, _) {
                            return Transform.scale(
                              scale: 1.3,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //! Language
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.background,
                          blurRadius: 5)
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.language,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 30,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text((translation(context).language),
                            style: const TextStyle(fontSize: 20)),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: DropdownButton<Language>(
                          iconSize: 40,
                          iconEnabledColor:
                              Theme.of(context).colorScheme.primary,
                          hint: Text(
                            translation(context).changeLanguage,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          dropdownColor:
                              Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(5),
                          underline: const SizedBox(),
                          items: Language.languageList()
                              .map<DropdownMenuItem<Language>>(
                                (e) => DropdownMenuItem<Language>(
                                  value: e,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        e.flag,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(e.name),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (Language? language) async {
                            if (language != null) {
                              Locale locale =
                                  await setLocale(language.languageCode);
                              // ignore: use_build_context_synchronously
                              MyApp.setLocale(context, locale);
                            }
                          },
                        ),
                      ),
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
