import 'package:flutter/material.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoMetro extends StatefulWidget {
  const InfoMetro({Key? key}) : super(key: key);

  @override
  State<InfoMetro> createState() => _InfoMetroState();
}

final Uri _url =
    Uri.parse('https://www.metro.cdmx.gob.mx/la-red/mapa-de-la-red');

class _InfoMetroState extends State<InfoMetro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCostSection(),
                const SizedBox(height: 20),
                _buildScheduleSection(
                  title: translation(context).daysOperation,
                  titleCont: translation(context).businessDays,
                  schedule: translation(context).businessDaysSchedule,
                ),
                const SizedBox(height: 5),
                _buildScheduleSection(
                  titleCont: translation(context).saturdays,
                  schedule: translation(context).saturdaysSchedule,
                ),
                const SizedBox(height: 5),
                _buildScheduleSection(
                  titleCont: translation(context).sundaysHolidays,
                  schedule: translation(context).sundaysHolidaysSchedule,
                ),
                //! SEPARADOR
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  height: 3,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _launchUrl,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            'assets/dashboard/mimetro.png',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.output,
                                  color: Color(0XFFFE4F00), size: 30),
                              const SizedBox(width: 10),
                              Text(
                                translation(context).moreInfo,
                                style: const TextStyle(
                                    color: Color(0XFFFE4F00),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCostSection() {
    return _buildSection(
      title: translation(context).costs,
      icon: Icons.monetization_on_outlined,
      children: [
        _buildCostTile(
            translation(context).tripCost, [translation(context).tripCostValue],
            icon: Icons.attach_money_outlined),
        _buildCostTile(
            translation(context).freeAccess,
            [
              translation(context).elderlyPeople,
              translation(context).peopleDisabilities,
              translation(context).children,
              translation(context).youngINJUVE,
              translation(context).authorizedPersonnel,
              translation(context).police,
            ],
            icon: Icons.accessibility),
      ],
    );
  }

  Widget _buildScheduleSection(
      {String? title, required String titleCont, required String schedule}) {
    return _buildSection(
      title: title,
      icon: title != null ? Icons.access_time : null,
      children: [
        _buildScheduleTile(titleCont, schedule),
      ],
    );
  }

  Widget _buildSection(
      {String? title, IconData? icon, required List<Widget> children}) {
    return Column(
      children: [
        if (title != null && icon != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        const SizedBox(height: 5),
        Card(
          color: Theme.of(context).colorScheme.secondary,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleTile(String day, String time) {
    return ListTile(
      title: Text(
        day,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(fontSize: 15),
      ),
      leading: const Icon(Icons.calendar_today),
      iconColor: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _buildCostTile(String title, List<String> items,
      {required IconData icon}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) => Text(
                  item,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ))
            .toList(),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
