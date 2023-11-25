import 'package:flutter/material.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoMetrobus extends StatefulWidget {
  const InfoMetrobus({super.key});

  @override
  State<InfoMetrobus> createState() => _InfoMetrobusState();
}

final Uri _url1 =
    Uri.parse('https://www.metrobus.cdmx.gob.mx/dependencia/acerca-de/rutas');
final Uri _url2 =
    Uri.parse('https://www.metrobus.cdmx.gob.mx/dependencia/PagoMB');

class _InfoMetrobusState extends State<InfoMetrobus> {
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
                  schedule: translation(context).operationMB,
                ),
                const SizedBox(height: 5),
                _buildScheduleSection(
                  titleCont: translation(context).saturdays,
                  schedule: translation(context).operationMB,
                ),
                const SizedBox(height: 5),
                _buildScheduleSection(
                  titleCont: translation(context).sundaysHolidays,
                  schedule: translation(context).operationMB,
                ),
                GestureDetector(
                  onTap: () => _launchUrl(_url1),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.output,
                                  color: Color(0XFFC9082A), size: 30),
                              const SizedBox(width: 10),
                              Text(
                                translation(context).daysOperationMB,
                                style: const TextStyle(
                                    color: Color(0XFFC9082A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ],
                    ),
                  ),
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
                  onTap: () => _launchUrl(_url2),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            'assets/dashboard/mimetrobus.png',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.output,
                                  color: Color(0XFFC9082A), size: 30),
                              const SizedBox(width: 10),
                              Text(
                                translation(context).moreInfo,
                                style: const TextStyle(
                                    color: Color(0XFFC9082A),
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
            translation(context).tripCost,
            [
              translation(context).tripCostValueMB,
              translation(context).tripCostInfoMB,
            ],
            icon: Icons.attach_money_outlined),
        _buildCostTile(
            translation(context).tripCostMBairport,
            [
              translation(context).tripCostValueMBairport,
              translation(context).tripMBairportInfo,
            ],
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

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
