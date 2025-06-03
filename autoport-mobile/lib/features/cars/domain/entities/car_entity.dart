import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final String id;
  final String userId;
  final String brand;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final int seats;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Car({
    required this.id,
    required this.userId,
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    required this.seats,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        brand,
        model,
        year,
        color,
        licensePlate,
        seats,
        photo,
        createdAt,
        updatedAt,
      ];
} 