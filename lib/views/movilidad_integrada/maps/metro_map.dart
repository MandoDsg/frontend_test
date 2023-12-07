import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MetroMap extends StatefulWidget {
  const MetroMap({Key? key}) : super(key: key);

  @override
  State<MetroMap> createState() => _MetroMapState();
}

class _MetroMapState extends State<MetroMap> {
  final String imagePath = 'assets/Maps/mapametro.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: PhotoView(
        backgroundDecoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onBackground),
        imageProvider: AssetImage(imagePath),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 4,
      ),
    );
  }
}
