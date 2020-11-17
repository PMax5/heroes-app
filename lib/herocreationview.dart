

import 'package:flutter/material.dart';
import 'package:heroesapp/heroservice.dart';
import 'package:flutter/services.dart';

import 'logger.dart';

class HeroCreationView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  HeroService heroService = new HeroService();
  String heroName;
  String heroId;

  createHero(BuildContext context, int id, String name) {
    try {
      this.heroService.createHero(id, name);
      Logger.logAction("Created hero with name=" + name + " and id=" + id.toString());
    } catch(e) {
      Logger.logError("Failed to create hero with name=" + name + " and id=" + id.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SINFO Heroes'),
        ),
        body: Form(
          key: this.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter hero name',
                ),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Please enter a valid name!';
                  return null;
                },
                onChanged: (value) {
                  this.heroName = value;
                },
              ),
              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: 'Enter hero id',
                ),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Please enter a valid id!';
                  return null;
                },
                onChanged: (value) {
                  this.heroId = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                    if (this.formKey.currentState.validate())
                      this.createHero(context, int.parse(this.heroId), this.heroName);
                    Navigator.pop(context);
                },
                child: const Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    )
                  ),
                )
              )
            ],
          ),
        )
    );

  }
}