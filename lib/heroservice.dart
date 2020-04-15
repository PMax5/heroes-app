
import 'dart:convert';

import "package:http/http.dart" as http;
import 'hero.dart';

class HeroService {

  final String apiUrl = "https://pmxpt.dev/heroes";

  Future<SinfoHero> createHero(int id, String title) async {
    final http.Response response = await http.post(
      this.apiUrl + "/hero",
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic> {
        'id': id,
        'title': title
      })
    );

    if (response.statusCode != 200)
      throw Exception("[SINFO Heroes] Failed to create hero.");

    return SinfoHero.fromJson(json.decode(response.body));
  }

  Future<List<SinfoHero>> getHeroes() async {
    
    List<SinfoHero> heroes = <SinfoHero>[];
    
    final http.Response response = await http.get(
      this.apiUrl + "/hero",
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Access-Control-Allow-Headers': 'Content-Type'
      }
    );

    if (response.statusCode != 200)
      throw Exception("[SINFO Heroes] Failed to load heroes.");

    var heroesJson = json.decode(response.body) as List;
    heroes = heroesJson.map((heroJson) => SinfoHero.fromJson(heroJson)).toList();
    return heroes;
  }

  Future<SinfoHero> getHero(int heroId) async {

    final http.Response response = await http.get(
      this.apiUrl + "/hero" + heroId.toString(),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Access-Control-Allow-Headers': 'Content-Type'
        }
    );

    if (response.statusCode != 200)
      throw Exception("[SINFO Heroes] Failed to load heroes.");

    return SinfoHero.fromJson(json.decode(response.body));
  }

}