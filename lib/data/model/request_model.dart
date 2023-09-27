class Requests {
  final String id;
  final String name;
  final String bloodType;
  final String rhesus;
  final String bloodRhesus;
  final String location;
  final String longlat;
  final String image;
  final String hospitalId;
  final String createDate;

  Requests({
    required this.id,
    required this.name,
    required this.bloodType,
    required this.rhesus,
    required this.bloodRhesus,
    required this.location,
    required this.longlat,
    required this.image,
    required this.hospitalId,
    required this.createDate,
  });

  factory Requests.fromJson(Map<String, dynamic> json) => Requests(
        id: json["id"],
        name: json["name"],
        bloodType: json["blood_type"],
        rhesus: json["rhesus"],
        bloodRhesus: json["blood_rhesus"],
        location: json["location"],
        longlat: json["longlat"],
        image: json["image"],
        hospitalId: json["hospital_id"],
        createDate: json["create_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "blood_type": bloodType,
        "rhesus": rhesus,
        "blood_rhesus": bloodRhesus,
        "location": location,
        "longlat": longlat,
        "image": image,
        "hospital_id": hospitalId,
        "create_date": createDate,
      };
}
