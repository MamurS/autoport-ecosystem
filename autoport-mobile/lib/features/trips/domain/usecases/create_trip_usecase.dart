import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/trip.dart';
import '../repositories/trip_repository.dart';
import '../../data/models/trip_models.dart';

class CreateTripParams extends Equatable {
  final String carId;
  final String fromCity;
  final String toCity;
  final DateTime departureTime;
  final int availableSeats;
  final double price;

  const CreateTripParams({
    required this.carId,
    required this.fromCity,
    required this.toCity,
    required this.departureTime,
    required this.availableSeats,
    required this.price,
  });

  @override
  List<Object> get props => [
    carId,
    fromCity,
    toCity,
    departureTime,
    availableSeats,
    price,
  ];
}

class CreateTripUseCase implements UseCase<Trip, CreateTripRequest> {
  final TripRepository repository;
  
  const CreateTripUseCase({required this.repository});
  
  @override
  Future<Either<Failure, Trip>> call(CreateTripRequest request) async {
    return await repository.createTrip(request);
  }
} 