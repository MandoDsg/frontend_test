import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CablebusL2Map extends StatefulWidget {
  const CablebusL2Map({Key? key}) : super(key: key);

  @override
  State<CablebusL2Map> createState() => _CablebusL2MapState();
}

class _CablebusL2MapState extends State<CablebusL2Map> {
  final String imagePath = 'assets/Maps/mapacablebusl2.jpg';

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
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
