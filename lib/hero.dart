class SinfoHero {
  int heroId;
  String heroTitle;

  SinfoHero(int id, String title) {
    this.heroId = id;
    this.heroTitle = title;
  }

  factory SinfoHero.fromJson(Map<String, dynamic> json) {
    return SinfoHero(json['id'], json['title']);
  }

  int getId() {
    return this.heroId;
  }

  String getTitle() {
    return this.heroTitle;
  }
}