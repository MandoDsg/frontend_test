import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/services/station_data.dart';
import 'package:frontend/services/station_page.dart';
import 'package:frontend/services/transfer_images.dart';

class SubMetrobusL3 extends StatefulWidget {
  const SubMetrobusL3({Key? key}) : super(key: key);

  @override
  State<SubMetrobusL3> createState() => _SubMetrobusL3State();
}

class _SubMetrobusL3State extends State<SubMetrobusL3> {
  bool invertListOrder = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF7B9B00),
          title: const Text("Metrobús - Línea 3",
              style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                invertListOrder
                    ? const Text("Pueblo Santa Cruz Atoyac",
                        style: TextStyle(color: Colors.white))
                    : const Text("Tenayuca",
                        style: TextStyle(color: Colors.white)),
                const Icon(Icons.swap_horiz, color: Colors.white),
                invertListOrder
                    ? const Text("Tenayuca",
                        style: TextStyle(color: Colors.white))
                    : const Text("Pueblo Santa Cruz Atoyac",
                        style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.swap_vert, size: 35),
              onPressed: () {
                setState(() {
                  invertListOrder = !invertListOrder;
                });
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: FutureBuilder<List<StationData>>(
          future: StationsApi.getUsersLocally(context),
          builder: (context, snapshot) {
            final stations = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  final reversedStations =
                      invertListOrder ? stations?.reversed.toList() : stations;
                  return buildStations(reversedStations ?? []);
                }
            }
          },
        ),
      );
  Widget buildStations(List<StationData> stations) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];

          return Column(
            children: [
              Card(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                elevation: 10,
                color: Theme.of(context).colorScheme.onBackground,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          StationPage(station: station),
                    )),
                    leading: Transform.scale(
                      scale: 1.5,
                      child: Image.asset(
                        station.imageUrl,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 5),
                            Text(
                              station.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (station.transfers != null)
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        StationPage(station: station),
                  )),
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    elevation: 10,
                    color: Theme.of(context).colorScheme.onBackground,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Icon(Icons.transfer_within_a_station)),
                          if (station.transfers != null)
                            Flexible(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: station.transfers!
                                    .map((transfer) => Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            Image.asset(
                                              transferImages
                                                      .containsKey(transfer)
                                                  ? transferImages[transfer]!
                                                  : 'assets/dashboard/logomi.png',
                                              height: 30,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      );
}

class StationsApi {
  static Future<List<StationData>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data =
        await assetBundle.loadString('assets/data/Metrobus/linea_3.json');
    final body = json.decode(data);

    return body.map<StationData>(StationData.fromJson).toList();
  }
}
