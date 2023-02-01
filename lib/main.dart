import 'package:flutter/material.dart';
import 'package:hackernews/src/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triqui App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Triqui'),
        ),
        body: const HomePage(),
      ),
    );
  }
}
