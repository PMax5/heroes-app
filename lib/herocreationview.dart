

import 'package:flutter/material.dart';
import 'package:heroesapp/heroes.dart';
import 'package:heroesapp/heroservice.dart';
import 'package:flutter/services.dart';
import 'hero.dart';

class HeroCreationView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  HeroService heroService = new HeroService();
  String heroName;
  String heroId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SINFO Heroes'),
        ),
        body: Form(
          key: _formKey,
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
                    if (_formKey.currentState.validate())
                      heroService.createHero(int.parse(heroId), heroName);
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