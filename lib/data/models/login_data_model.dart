import '/domain/entities/client_details_data_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.userName, required super.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(userName: json["user_name"], password: json["password"]);

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "password": password,
  };
}
