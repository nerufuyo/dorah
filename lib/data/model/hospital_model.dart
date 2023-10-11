class Hospitals {
  final String id;
  final String name;
  final String type;
  final Location location;
  final String longlat;
  final String image;
  final String openHour;

  Hospitals({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.longlat,
    required this.image,
    required this.openHour,
  });

  factory Hospitals.fromJson(Map<String, dynamic> json) => Hospitals(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        location: Location.fromJson(json["location"]),
        longlat: json["longlat"],
        image: json["image"],
        openHour: json["open_hour"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "location": location.toJson(),
        "longlat": longlat,
        "image": image,
        "open_hour": openHour,
      };
}

class Location {
  final String street;
  final String city;
  final String province;

  Location({
    required this.street,
    required this.city,
    required this.province,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json["street"],
        city: json["city"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "province": province,
      };
}
