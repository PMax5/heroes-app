
import 'package:flutter/material.dart';
import 'package:heroesapp/heroview.dart';

import 'heroes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SINFO Heroes',
      home: HeroesList()
    );
  }
}