import 'package:flutter/material.dart';

class SubMIView extends StatefulWidget {
  const SubMIView({super.key});

  @override
  State<SubMIView> createState() => _SubMIViewState();
}

class Tweet {
  final String username;
  final String content;

  Tweet(this.username, this.content);
}

class _SubMIViewState extends State<SubMIView> {
  final List<Tweet> tweets = [
    Tweet("Usuario1", "Este es un tweet de ejemplo."),
    Tweet("Usuario2", "¡Hola, mundo!"),
    Tweet("Usuario3", "Flutter es genial."),
    // Agrega más tweets simulados aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweets Simulados'),
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(tweets[index].username),
            subtitle: Text(tweets[index].content),
          );
        },
      ),
    );
  }
}
