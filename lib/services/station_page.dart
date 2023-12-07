import 'package:flutter/material.dart';
import 'package:frontend/languages/language_constants.dart';
import 'package:frontend/services/station_data.dart';
import 'package:frontend/services/transfer_images_stationpage.dart';

class StationPage extends StatelessWidget {
  final StationData station;

  const StationPage({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(station.name),
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    station.imageUrl,
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    station.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  if (station.transfers != null)
                    Column(
                      children: [
                        Card(
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          color: Theme.of(context).colorScheme.secondary,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  (translation(context).transfers),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 20),
                                if (station.transfers != null)
                                  Column(
                                    children: station.transfers!
                                        .map(
                                          (transfer) => Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.alt_route),
                                                  Text(transfer,
                                                      style: const TextStyle(
                                                          fontSize: 15)),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Image.asset(
                                                        transferImagesStationPage
                                                                    .containsKey(
                                                                        transfer) &&
                                                                transferImagesStationPage[
                                                                        transfer]!
                                                                    .isNotEmpty
                                                            ? transferImagesStationPage[
                                                                transfer]![0]
                                                            : 'assets/dashboard/logomi.png',
                                                        height: 40,
                                                      ),
                                                    ),
                                                  ),
                                                  if (transferImagesStationPage
                                                          .containsKey(
                                                              transfer) &&
                                                      transferImagesStationPage[
                                                                  transfer]!
                                                              .length >
                                                          1)
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Image.asset(
                                                        transferImagesStationPage[
                                                            transfer]![1],
                                                        height: 40,
                                                      ),
                                                    )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
