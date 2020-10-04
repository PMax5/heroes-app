
import 'package:flutter/material.dart';
import 'package:heroesapp/herocreationview.dart';
import 'package:heroesapp/heroservice.dart';
import 'logger.dart';
import 'hero.dart';
import 'heroview.dart';
class HeroesList extends StatelessWidget {

  Future<List<SinfoHero>> heroes;
  HeroService heroesService = new HeroService();
  final biggerFont = const TextStyle(fontSize: 18.0);

    Future<List<SinfoHero>> getHeroes(BuildContext context) async {
      try {
        return this.heroesService.getHeroes();
      } catch (Exception) {
        Logger.logError("Failed to load heroes.");
      }
    }

    Widget buildHeroes(BuildContext context) {

    return FutureBuilder<List<SinfoHero>>(
      future: this.getHeroes(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Text(
                'Could not load any heroes!'
            );
          }

          return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return this.buildRow(snapshot.data[i], context);
              }
          );
        }
    );
  }

  Widget buildRow(SinfoHero hero, BuildContext context) {
    return
      Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                hero.getName(),
                style: this.biggerFont,
            ),
              trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroView(hero))
                  );
               },
              )
            )
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SINFO Heroes'),
      ),
      body: this.buildHeroes(context),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => HeroCreationView())
          )
        },
        tooltip: 'Add Hero',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

}