
import 'package:flutter/material.dart';
import 'hero.dart';
import 'heroview.dart';

class HeroesList extends StatelessWidget {

  List<SinfoHero> heroes = <SinfoHero>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildHeroes() {
    this.heroes.add(new SinfoHero(12354, "Test1"));
    this.heroes.add(new SinfoHero(12345, "Test2"));
    this.heroes.add(new SinfoHero(12346, "Test3"));
    this.heroes.add(new SinfoHero(12347, "Test4"));
    this.heroes.add(new SinfoHero(12348, "Test5"));

    return ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: heroes.length,
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(this.heroes[i], context);
        },
       separatorBuilder: (BuildContext context, int index) => const Divider()
    );
  }

  Widget _buildRow(SinfoHero hero, BuildContext context) {
    return ListTile(
      title: Text(
        hero.getTitle(),
        style: _biggerFont,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SINFO Heroes'),
      ),
      body: _buildHeroes(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Hero',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

}