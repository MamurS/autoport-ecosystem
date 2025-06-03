// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_models.dart';

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

CreateBookingRequestModel _$CreateBookingRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateBookingRequestModel(
      tripId: json['tripId'] as String,
      seats: (json['seats'] as num).toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CreateBookingRequestModelToJson(
        CreateBookingRequestModel instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'seats': instance.seats,
      'notes': instance.notes,
    };

BookingListResponse _$BookingListResponseFromJson(Map<String, dynamic> json) =>
    BookingListResponse(
      bookings: (json['bookings'] as List<dynamic>)
          .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$BookingListResponseToJson(
        BookingListResponse instance) =>
    <String, dynamic>{
      'bookings': instance.bookings,
      'page': instance.page,
      'total': instance.total,
    };
