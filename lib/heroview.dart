

import 'package:flutter/material.dart';
import 'hero.dart';

class HeroView extends StatelessWidget {

  SinfoHero hero;

  HeroView(SinfoHero hero) {
    this.hero = hero;
  }

  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Hero Name: " + this.hero.getName(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                ),
                Text(
                  "Hero ID: " + this.hero.getId().toString(),
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          )
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {},
      child: const Text(
          'Edit',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          )
      ),
    );
  }

  Widget _buildDeleteButton() {
    return RaisedButton(
      color: Colors.red,
      onPressed: () {},
      child: const Text(
          'Delete',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SINFO Hero'),
      ),
      body: Column(
        children: <Widget>[
          _buildTitleSection(),
          _buildEditButton(),
          _buildDeleteButton()
        ],
      )
    );
  }

}