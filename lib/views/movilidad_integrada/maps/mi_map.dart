import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MIMap extends StatefulWidget {
  const MIMap({Key? key}) : super(key: key);

  @override
  State<MIMap> createState() => _MIMapState();
}

class _MIMapState extends State<MIMap> {
  final String imagePath = 'assets/Maps/mapami.png';

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
