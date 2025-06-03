import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/trip.dart';
import '../repositories/trip_repository.dart';
import '../../data/models/trip_models.dart';

class UpdateTripParams {
  final String tripId;
  final UpdateTripRequest request;

  const UpdateTripParams({
    required this.tripId,
    required this.request,
  });
}

class UpdateTripUseCase implements UseCase<Trip, UpdateTripParams> {
  final TripRepository repository;
  
  const UpdateTripUseCase({required this.repository});
  
  @override
  Future<Either<Failure, Trip>> call(UpdateTripParams params) async {
    return await repository.updateTrip(params.tripId, params.request);
  }
} 