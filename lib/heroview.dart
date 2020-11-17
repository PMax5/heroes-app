

import 'package:flutter/material.dart';
import 'package:heroesapp/heroservice.dart';
import 'heroeditview.dart';
import 'logger.dart';
import 'hero.dart';

class HeroView extends StatelessWidget {

  SinfoHero hero;
  HeroService heroService = new HeroService();

  HeroView(SinfoHero hero) {
    this.hero = hero;
  }

  deleteHero(BuildContext context, int id) {
    try {
      this.heroService.deleteHero(id);
      Logger.logAction("Deleted hero with id=" + id.toString());
    } catch(Exception) {
      Logger.logError("Failed to create hero with " + "and id=" + id.toString());
    }
  }

  Widget buildTitleSection() {
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

  Widget buildEditButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HeroEditView(this.hero))
        );
      },
      child: const Text(
          'Edit',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          )
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Deletion Confirmation"),
              content: new Text("Are you sure you want to delete this hero?"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
                ),
                new FlatButton(
                    child: new Text("Confirm"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                      this.heroService.deleteHero(this.hero.getId());
                    }
                ),
              ],
            );
          },
        );
      },
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
          this.buildTitleSection(),
          this.buildEditButton(context),
          this.buildDeleteButton(context)
        ],
      )
    );
  }

}