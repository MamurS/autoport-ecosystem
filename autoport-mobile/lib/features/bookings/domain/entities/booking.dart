import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String id;
  final String tripId;
  final String userId;
  final String driverId;
  final String driverName;
  final String? driverAvatar;
  final String from;
  final String to;
  final DateTime departureTime;
  final int seats;
  final double price;
  final String currency;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;

  const Booking({
    required this.id,
    required this.tripId,
    required this.userId,
    required this.driverId,
    required this.driverName,
    this.driverAvatar,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.seats,
    required this.price,
    required this.currency,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
    id,
    tripId,
    userId,
    driverId,
    driverName,
    driverAvatar,
    from,
    to,
    departureTime,
    seats,
    price,
    currency,
    status,
    createdAt,
    updatedAt,
    isActive,
  ];
} 