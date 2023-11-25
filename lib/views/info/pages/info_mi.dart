import 'package:flutter/material.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoMI extends StatefulWidget {
  const InfoMI({Key? key}) : super(key: key);

  @override
  State<InfoMI> createState() => _InfoMIState();
}

final Uri _url1 =
    Uri.parse('https://www.metrobus.cdmx.gob.mx/dependencia/PagoMB');
final Uri _url2 = Uri.parse(
    'https://metro.cdmx.gob.mx/tramites-y-servicios/servicios/tarjeta-recargable');

class _InfoMIState extends State<InfoMI> {
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
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        translation(context).micard,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        translation(context).relCard,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'assets/dashboard/manotarjetami.png',
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on_outlined,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        translation(context).cardCost,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Text(
                    translation(context).cardCostValue,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.payment_outlined,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        translation(context).maxAmount,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Text(
                    translation(context).maxAmountValue,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                //! SEPARADOR
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
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
                //! INFO - IMPORTANTE
                _buildInfoSection(
                  title: translation(context).important,
                  infoCont: translation(context).importantP1,
                  customIcon: Icons.warning,
                ),
                _buildInfoSection(
                  infoCont: translation(context).importantP2,
                ),
                _buildInfoSection(
                  infoCont: translation(context).importantP3,
                ),
                _buildInfoSection(
                  infoCont: translation(context).importantP4,
                ),
                const SizedBox(height: 20),
                //! INFO - ENTRADA
                _buildInfoSection(
                  title: translation(context).howEnterWcard,
                  infoCont: translation(context).howEnterWcardP1,
                  customIcon: Icons.question_answer_outlined,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howEnterWcardP2,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howEnterWcardP3,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howEnterWcardP4,
                ),
                const SizedBox(height: 20),
                //! INFO - COMO COMPRO Y RECARGO
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.question_answer_outlined,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        translation(context).howPurchaseOrReload,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/dashboard/maquina.png',
                  ),
                ),
                const SizedBox(height: 10),
                //! COMPRA
                _buildInfoSection(
                  title: translation(context).howPurchase,
                  infoCont: translation(context).howPurchaseP1,
                  customIcon: Icons.shopping_bag,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howPurchaseP2,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howPurchaseP3,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howPurchaseP4,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howPurchaseP5,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howPurchaseP6,
                ),
                const SizedBox(height: 10),
                //! RECARGA
                _buildInfoSection(
                  title: translation(context).howReload,
                  infoCont: translation(context).howReloadP1,
                  customIcon: Icons.shopping_bag,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howReloadP2,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howReloadP3,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howReloadP4,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howReloadP5,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howReloadP6,
                ),
                _buildInfoSection(
                  infoCont: translation(context).howReloadP7,
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => _launchUrl(_url1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.output,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30),
                      const SizedBox(width: 10),
                      Text(
                        translation(context).moreInfo,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //! INFO - RECOMENDACIONES
                _buildInfoSection(
                  title: translation(context).suggestions,
                  infoCont: translation(context).suggestionsP1,
                  customIcon: Icons.thumb_up,
                ),
                _buildInfoSection(
                  infoCont: translation(context).suggestionsP2,
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
                            'assets/dashboard/mi.png',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.output,
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                translation(context).moreInfo,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
