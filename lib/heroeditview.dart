

import 'package:flutter/material.dart';
import 'package:heroesapp/logger.dart';
import 'package:heroesapp/heroservice.dart';
import 'package:flutter/services.dart';
import 'hero.dart';

class HeroEditView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  HeroService heroService = new HeroService();
  SinfoHero hero;

  HeroEditView(SinfoHero hero) {
    this.hero = hero;
  }

  updateHeroName(BuildContext context) {
    try {
      this.heroService.updateHeroName(this.hero);
      Logger.logAction("Updated hero with name=" + this.hero.getName() + " and id=" + this.hero.getId().toString());
    } catch(e) {
      Logger.logError("Failed to update hero with id=" + this.hero.getId().toString());
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
                initialValue: this.hero.getName(),
                decoration: const InputDecoration(
                  hintText: 'Enter hero name',

                ),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Please enter a valid name!';
                  return null;
                },
                onChanged: (value) {
                  this.hero.setName(value);
                },
              ),
              TextFormField(
                initialValue: this.hero.getId().toString(),
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
                  this.hero.setId(int.parse(value));
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      this.updateHeroName(context);
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