// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      color: json['color'] as String,
      licensePlate: json['licensePlate'] as String,
      seats: (json['seats'] as num).toInt(),
      photo: json['photo'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'color': instance.color,
      'licensePlate': instance.licensePlate,
      'seats': instance.seats,
      'photo': instance.photo,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

AddCarRequestModel _$AddCarRequestModelFromJson(Map<String, dynamic> json) =>
    AddCarRequestModel(
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      color: json['color'] as String,
      licensePlate: json['licensePlate'] as String,
      seats: (json['seats'] as num).toInt(),
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$AddCarRequestModelToJson(AddCarRequestModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'color': instance.color,
      'licensePlate': instance.licensePlate,
      'seats': instance.seats,
      'photo': instance.photo,
    };

UpdateCarRequestModel _$UpdateCarRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateCarRequestModel(
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      color: json['color'] as String,
      licensePlate: json['licensePlate'] as String,
      seats: (json['seats'] as num).toInt(),
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UpdateCarRequestModelToJson(
        UpdateCarRequestModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'color': instance.color,
      'licensePlate': instance.licensePlate,
      'seats': instance.seats,
      'photo': instance.photo,
    };

CarListResponse _$CarListResponseFromJson(Map<String, dynamic> json) =>
    CarListResponse(
      cars: (json['cars'] as List<dynamic>)
          .map((e) => CarModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CarListResponseToJson(CarListResponse instance) =>
    <String, dynamic>{
      'cars': instance.cars,
      'total': instance.total,
    };
