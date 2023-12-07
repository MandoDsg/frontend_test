import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MetrobusMap extends StatefulWidget {
  const MetrobusMap({Key? key}) : super(key: key);

  @override
  State<MetrobusMap> createState() => _MetrobusMapState();
}

class _MetrobusMapState extends State<MetrobusMap> {
  final String imagePath = 'assets/Maps/mapametrobus.jpg';

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
        maxScale: PhotoViewComputedScale.covered * 5,
      ),
    );
  }
}
