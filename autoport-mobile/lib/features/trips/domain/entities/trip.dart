import 'package:equatable/equatable.dart';

class Trip extends Equatable {
  final String id;
  final String driverId;
  final String driverName;
  final double? driverRating;
  final String fromLocation;
  final String toLocation;
  final DateTime departureDateTime;
  final int totalSeats;
  final int availableSeats;
  final double pricePerSeat;
  final String? carMake;
  final String? carModel;
  final String? carColor;
  final String? carLicensePlate;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Trip({
    required this.id,
    required this.driverId,
    required this.driverName,
    this.driverRating,
    required this.fromLocation,
    required this.toLocation,
    required this.departureDateTime,
    required this.totalSeats,
    required this.availableSeats,
    required this.pricePerSeat,
    this.carMake,
    this.carModel,
    this.carColor,
    this.carLicensePlate,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get hasAvailableSeats => availableSeats > 0;
  double get totalPrice => pricePerSeat * totalSeats;
  String get route => '$fromLocation → $toLocation';

  @override
  List<Object?> get props => [
        id,
        driverId,
        driverName,
        driverRating,
        fromLocation,
        toLocation,
        departureDateTime,
        totalSeats,
        availableSeats,
        pricePerSeat,
        carMake,
        carModel,
        carColor,
        carLicensePlate,
        isVerified,
        createdAt,
        updatedAt,
      ];
} 