import 'package:equatable/equatable.dart';

class CreateTripRequestModel extends Equatable {
  final String from;
  final String to;
  final DateTime departureTime;
  final int totalSeats;
  final double price;
  final String currency;
  final String carModel;
  final String carColor;
  final String carNumber;
  final String? notes;

  const CreateTripRequestModel({
    required this.from,
    required this.to,
    required this.departureTime,
    required this.totalSeats,
    required this.price,
    required this.currency,
    required this.carModel,
    required this.carColor,
    required this.carNumber,
    this.notes,
  });

  @override
  List<Object?> get props => [
    from,
    to,
    departureTime,
    totalSeats,
    price,
    currency,
    carModel,
    carColor,
    carNumber,
    notes,
  ];
}

class UpdateTripRequestModel extends Equatable {
  final DateTime? departureTime;
  final int? totalSeats;
  final double? price;
  final String? notes;

  const UpdateTripRequestModel({
    this.departureTime,
    this.totalSeats,
    this.price,
    this.notes,
  });

  @override
  List<Object?> get props => [
    departureTime,
    totalSeats,
    price,
    notes,
  ];
} 