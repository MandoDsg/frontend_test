import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CablebusL1Map extends StatefulWidget {
  const CablebusL1Map({Key? key}) : super(key: key);

  @override
  State<CablebusL1Map> createState() => _CablebusL1MapState();
}

class _CablebusL1MapState extends State<CablebusL1Map> {
  final String imagePath = 'assets/Maps/mapacablebusl1.jpg';

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
        maxScale: PhotoViewComputedScale.covered * 1.5,
      ),
    );
  }
}
