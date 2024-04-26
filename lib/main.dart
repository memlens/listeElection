import 'package:flutter/material.dart';
import 'package:mechant/others/showelect.dart';
import 'showelect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Election App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowElectPage(),
    );
  }
}