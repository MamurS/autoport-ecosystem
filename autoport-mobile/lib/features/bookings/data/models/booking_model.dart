import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/booking.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.tripId,
    required super.userId,
    required super.driverId,
    required super.driverName,
    super.driverAvatar,
    required super.from,
    required super.to,
    required super.departureTime,
    required super.seats,
    required super.price,
    required super.currency,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.isActive,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  factory BookingModel.fromEntity(Booking booking) => BookingModel(
    id: booking.id,
    tripId: booking.tripId,
    userId: booking.userId,
    driverId: booking.driverId,
    driverName: booking.driverName,
    driverAvatar: booking.driverAvatar,
    from: booking.from,
    to: booking.to,
    departureTime: booking.departureTime,
    seats: booking.seats,
    price: booking.price,
    currency: booking.currency,
    status: booking.status,
    createdAt: booking.createdAt,
    updatedAt: booking.updatedAt,
    isActive: booking.isActive,
  );
} 