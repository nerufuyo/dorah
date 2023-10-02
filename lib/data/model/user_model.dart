class Users {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String image;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
      };
}
