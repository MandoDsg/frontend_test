import 'package:flutter/material.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoElInsurgente extends StatefulWidget {
  const InfoElInsurgente({Key? key}) : super(key: key);

  @override
  State<InfoElInsurgente> createState() => _InfoElInsurgenteState();
}

final Uri _url = Uri.parse('https://trenelinsurgente.mx/reglamento/');

class _InfoElInsurgenteState extends State<InfoElInsurgente> {
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
                  schedule: translation(context).saturdaysScheduleCB,
                ),
                const SizedBox(height: 5),
                _buildScheduleSection(
                  titleCont: translation(context).saturdays,
                  schedule: translation(context).saturdaysScheduleCB,
                ),
                const SizedBox(height: 5),
                _buildScheduleSection(
                  titleCont: translation(context).sundaysHolidays,
                  schedule: translation(context).saturdaysScheduleCB,
                ),
                const SizedBox(height: 20),
                //! INFO - RECOMENDACIONES
                _buildInfoSection(
                  title: translation(context).enforcement,
                  infoCont: translation(context).enforcementP1,
                  customIcon: Icons.gavel,
                ),
                _buildInfoSection(
                  infoCont: translation(context).enforcementP2,
                ),
                _buildInfoSection(
                  infoCont: translation(context).enforcementP3,
                ),
                _buildInfoSection(
                  infoCont: translation(context).enforcementP4,
                ),
                _buildInfoSection(
                  infoCont: translation(context).enforcementP5,
                ),
                _buildInfoSection(
                  infoCont: translation(context).enforcementP6,
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
                            'assets/dashboard/mielinsurgente.png',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.output,
                                  color: Color(0XFF84302A), size: 30),
                              const SizedBox(width: 10),
                              Text(
                                translation(context).moreInfo,
                                style: const TextStyle(
                                    color: Color(0XFF84302A),
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
              translation(context).tripCostValueEI,
              translation(context).tripCostInfoEI,
              translation(context).tripEIInfo,
            ],
            icon: Icons.attach_money_outlined),
        _buildCostTile(
            translation(context).freeAccess,
            [
              translation(context).tripEIInfo2,
              translation(context).tripEIInfo3,
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

  Widget _buildInfoSection({
    String? title,
    required String infoCont,
    IconData? customIcon,
  }) {
    return _buildSection(
      title: title,
      icon: title != null ? customIcon : null,
      children: [
        _buildInfoTile(infoCont),
      ],
    );
  }

  Widget _buildInfoTile(String textCont) {
    return ListTile(
      title: Text(
        textCont,
        style: const TextStyle(fontSize: 15),
      ),
      leading: const Icon(
        Icons.fiber_manual_record,
        size: 15,
      ),
      iconColor: Theme.of(context).colorScheme.primary,
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
