//TODO: Change this when actual data or its contract has been provided

class ErrorModel {
  ErrorModel({
    required this.errorMessage,
    required this.errorCode,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        errorMessage: json["errorMessage"],
        errorCode: json["errorCode"],
      );

  final String errorMessage;
  final num errorCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        "errorMessage": errorMessage,
        "errorCode": errorCode,
      };
}
