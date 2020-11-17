
import 'dart:convert';
import "package:http/http.dart" as http;
import 'hero.dart';

class HeroService {

  final String apiUrl = "https://api.pmxpt.dev/";
  final Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Headers': 'Content-Type'
  };

  Future<SinfoHero> createHero(int id, String title) async {
    final http.Response response = await http.post(
      this.apiUrl + "/hero",
      headers: <String, String> {
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, dynamic> {
        'id': id,
        'name': title
      })
    );

    if (response.statusCode != 200)
      throw new Exception();

    return SinfoHero.fromJson(json.decode(response.body));
  }

  Future<List<SinfoHero>> getHeroes() async {
    
    List<SinfoHero> heroes = <SinfoHero>[];
    
    final http.Response response = await http.get(
      this.apiUrl + "/hero",
      headers: requestHeaders
    );

    if (response.statusCode != 200)
      throw new Exception();

    var heroesJson = json.decode(response.body) as List;
    heroes = heroesJson.map((heroJson) => SinfoHero.fromJson(heroJson)).toList();
    return heroes;
  }

  Future<SinfoHero> getHero(int heroId) async {

    final http.Response response = await http.get(
      this.apiUrl + "/hero" + heroId.toString(),
      headers: requestHeaders
    );

    if (response.statusCode != 200)
      throw new Exception();

    return SinfoHero.fromJson(json.decode(response.body));
  }

  void deleteHero(int heroId) async {
    final http.Response response = await http.delete(
      this.apiUrl + "/hero/" + heroId.toString(),
      headers: requestHeaders
    );

    if (response.statusCode != 200)
      throw new Exception();
  }

  Future<SinfoHero> updateHeroName(SinfoHero hero) async {
    final http.Response response = await http.put(
      this.apiUrl + "/hero",
      headers: requestHeaders,
      body: jsonEncode(<String, dynamic> {
        'id': hero.getId(),
        'name': hero.getName()
      })
    );

    if (response.statusCode != 200)
      throw new Exception();

    return SinfoHero.fromJson(json.decode(response.body));
  }

}