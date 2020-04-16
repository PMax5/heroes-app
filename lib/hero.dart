class SinfoHero {
  int heroId;
  String heroName;

  SinfoHero(int id, String name) {
    this.heroId = id;
    this.heroName = name;
  }

  factory SinfoHero.fromJson(Map<String, dynamic> json) {
    return SinfoHero(json['id'], json['name']);
  }

  int getId() {
    return this.heroId;
  }

  String getName() {
    return this.heroName;
  }

}