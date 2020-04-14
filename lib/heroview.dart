

import 'package:flutter/material.dart';
import 'hero.dart';

class HeroView extends StatelessWidget {

  SinfoHero hero;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  HeroView(SinfoHero hero) {
    this.hero = hero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SINFO Hero'),
      ),
      body: Container(
          child: Center(
            child: Text(
                "Hero Name: " + this.hero.getTitle() + "\n Hero ID: " + this.hero.getId().toString(),
                style: _biggerFont
            )
          )
      ),
    );
  }

}