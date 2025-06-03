import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/trip.dart';
import '../repositories/trip_repository.dart';

class GetTripDetailsParams extends Equatable {
  final String tripId;

  const GetTripDetailsParams(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

class GetTripDetailsUseCase implements UseCase<Trip, String> {
  final TripRepository repository;
  
  const GetTripDetailsUseCase({required this.repository});
  
  @override
  Future<Either<Failure, Trip>> call(String tripId) async {
    return await repository.getTripDetails(tripId);
  }
} 