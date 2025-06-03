// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      id: json['id'] as String,
      tripId: json['tripId'] as String,
      userId: json['userId'] as String,
      driverId: json['driverId'] as String,
      driverName: json['driverName'] as String,
      driverAvatar: json['driverAvatar'] as String?,
      from: json['from'] as String,
      to: json['to'] as String,
      departureTime: DateTime.parse(json['departureTime'] as String),
      seats: (json['seats'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tripId': instance.tripId,
      'userId': instance.userId,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverAvatar': instance.driverAvatar,
      'from': instance.from,
      'to': instance.to,
      'departureTime': instance.departureTime.toIso8601String(),
      'seats': instance.seats,
      'price': instance.price,
      'currency': instance.currency,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isActive': instance.isActive,
    };
