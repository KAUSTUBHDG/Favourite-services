//TODO: Change this when actual data or its contract has been provided

import '/domain/entities/app_theme_entity.dart';

class AppModel extends AppEntity {
  AppModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address,
    "phone": phone,
    "website": website,
    "company": company,
  };
}

class Address extends AddressEntity {
  Address({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
    geo: Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
    "geo": geo,
  };
}

class Geo extends GeoEntity {
  Geo({required super.lat, required super.lng});

  factory Geo.fromJson(Map<String, dynamic> json) =>
      Geo(lat: json["lat"], lng: json["lng"]);

  Map<String, dynamic> toJson() => <String, dynamic>{"lat": lat, "lng": lng};
}

class Company extends CompanyEntity {
  Company({required super.name, required super.catchPhrase, required super.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    catchPhrase: json["catchPhrase"],
    bs: json["bs"],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}

// // To parse this JSON data, do
// //
// //     final listOfPost = listOfPostFromJson(jsonString);

// import 'dart:convert';

// List<ListOfPost> listOfPostFromJson(String str) => List<ListOfPost>.from(json.decode(str).map((x) => ListOfPost.fromJson(x)));

// String listOfPostToJson(List<ListOfPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ListOfPost {
//     final int userId;
//     final int id;
//     final String title;
//     final String body;

//     ListOfPost({
//         required this.userId,
//         required this.id,
//         required this.title,
//         required this.body,
//     });

//     factory ListOfPost.fromJson(Map<String, dynamic> json) => ListOfPost(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//     );

//     Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//     };
// }
