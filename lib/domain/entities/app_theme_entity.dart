//TODO: Change this when actual data or its contract has been provided
class AppEntity {
  AppEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressEntity address;
  final String phone;
  final String website;
  final CompanyEntity company;
}

class AddressEntity {
  AddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
  String street;
  String suite;
  String city;
  String zipcode;
  GeoEntity geo;
}

class GeoEntity {
  GeoEntity({
    required this.lat,
    required this.lng,
  });
  String lat;
  String lng;
}

class CompanyEntity {
  CompanyEntity({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  String name;
  String catchPhrase;
  String bs;
}
