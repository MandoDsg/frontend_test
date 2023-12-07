import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class TrenLigeroMap extends StatefulWidget {
  const TrenLigeroMap({Key? key}) : super(key: key);

  @override
  State<TrenLigeroMap> createState() => _TrenLigeroMapState();
}

class _TrenLigeroMapState extends State<TrenLigeroMap> {
  final String imagePath = 'assets/Maps/mapaste.jpg';

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
