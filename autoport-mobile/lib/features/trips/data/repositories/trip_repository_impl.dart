import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/search_result_entity.dart';
import '../../domain/entities/search_params.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/trip_remote_datasource.dart';
import '../models/trip_models.dart';

class TripRepositoryImpl implements TripRepository {
  final TripRemoteDataSource remoteDataSource;
  
  const TripRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, SearchResultEntity>> searchTrips(SearchTripsParams params) async {
    try {
      final response = await remoteDataSource.searchTrips(params);
      return Right(SearchResultEntity(
        trips: response.trips,
        total: response.total,
        page: response.page,
        hasMorePages: response.page < response.totalPages,
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Trip>> getTripDetails(String tripId) async {
    try {
      final response = await remoteDataSource.getTripDetails(tripId);
      return Right(response.trip);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Trip>> createTrip(CreateTripRequest request) async {
    try {
      final response = await remoteDataSource.createTrip(request);
      return Right(response.trip);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Trip>> updateTrip(String tripId, UpdateTripRequest request) async {
    try {
      final response = await remoteDataSource.updateTrip(tripId, request);
      return Right(response.trip);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> cancelTrip(String tripId) async {
    try {
      await remoteDataSource.cancelTrip(tripId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, SearchResultEntity>> getMyTrips(MyTripsParams params) async {
    try {
      final response = await remoteDataSource.getMyTrips(params);
      return Right(SearchResultEntity(
        trips: response.trips,
        total: response.total,
        page: response.page,
        hasMorePages: response.page < response.totalPages,
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
} 