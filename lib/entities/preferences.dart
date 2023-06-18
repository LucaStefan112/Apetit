class Preferences {
  String likes;
  String dislikes;
  String avoids;
  String diet;

  Preferences({
    required this.likes,
    required this.dislikes,
    required this.avoids,
    required this.diet
  });

  factory Preferences.fromJson(Map<String, dynamic> json) {
    return Preferences(
      likes: json['likes'],
      dislikes: json['dislikes'],
      avoids: json['avoids'],
      diet: json['diet']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'likes': likes,
      'dislikes': dislikes,
      'avoids': avoids,
      'diet': diet
    };
  }
}