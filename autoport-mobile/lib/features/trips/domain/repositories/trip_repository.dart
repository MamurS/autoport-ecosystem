import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/trip.dart';
import '../entities/search_result_entity.dart';
import '../entities/search_params.dart';
import '../../data/models/trip_models.dart';

abstract class TripRepository {
  Future<Either<Failure, SearchResultEntity>> searchTrips(SearchTripsParams params);
  Future<Either<Failure, Trip>> getTripDetails(String tripId);
  Future<Either<Failure, Trip>> createTrip(CreateTripRequest request);
  Future<Either<Failure, Trip>> updateTrip(String tripId, UpdateTripRequest request);
  Future<Either<Failure, void>> cancelTrip(String tripId);
  Future<Either<Failure, SearchResultEntity>> getMyTrips(MyTripsParams params);
} 