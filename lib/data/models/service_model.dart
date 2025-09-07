import '../../domain/entities/service.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: (json['id'] as num).toInt(),
      title: (json['title'] as String?) ?? '',
      description: (json['body'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': description};
  }
}
