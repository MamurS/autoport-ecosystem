import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/car_entity.dart';

part 'car_models.g.dart';

@JsonSerializable()
class CarModel extends Car {
  const CarModel({
    required super.id,
    required super.userId,
    required super.brand,
    required super.model,
    required super.year,
    required super.color,
    required super.licensePlate,
    required super.seats,
    super.photo,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarModelToJson(this);

  Car toEntity() => Car(
        id: id,
        userId: userId,
        brand: brand,
        model: model,
        year: year,
        color: color,
        licensePlate: licensePlate,
        seats: seats,
        photo: photo,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@JsonSerializable()
class AddCarRequestModel {
  final String brand;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final int seats;
  final String? photo;

  const AddCarRequestModel({
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    required this.seats,
    this.photo,
  });

  factory AddCarRequestModel.fromJson(Map<String, dynamic> json) => _$AddCarRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddCarRequestModelToJson(this);
}

@JsonSerializable()
class UpdateCarRequestModel {
  final String brand;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final int seats;
  final String? photo;

  const UpdateCarRequestModel({
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    required this.seats,
    this.photo,
  });

  factory UpdateCarRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateCarRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateCarRequestModelToJson(this);
}

@JsonSerializable()
class CarListResponse {
  final List<CarModel> cars;
  final int total;

  const CarListResponse({
    required this.cars,
    required this.total,
  });

  factory CarListResponse.fromJson(Map<String, dynamic> json) => _$CarListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CarListResponseToJson(this);
} 