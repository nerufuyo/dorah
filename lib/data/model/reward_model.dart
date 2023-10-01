class Rewards {
  final String id;
  final String title;
  final int points;
  final String imageUrl;
  final String category;

  Rewards({
    required this.id,
    required this.title,
    required this.points,
    required this.imageUrl,
    required this.category,
  });

  factory Rewards.fromJson(Map<String, dynamic> json) => Rewards(
        id: json["id"],
        title: json["title"],
        points: json["points"],
        imageUrl: json["image_url"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "points": points,
        "image_url": imageUrl,
        "category": category,
      };
}
