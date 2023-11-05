import 'package:flutter/material.dart';
import 'package:frontend/navigation/app_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RutasMIPN',
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
    );
  }
}
