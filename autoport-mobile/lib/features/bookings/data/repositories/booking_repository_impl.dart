import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';
import '../models/booking_models.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Booking>>> getActiveBookings() async {
    try {
      final bookings = await remoteDataSource.getActiveBookings();
      return Right(bookings.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Booking>>> getAllBookings() async {
    try {
      final bookings = await remoteDataSource.getAllBookings();
      return Right(bookings.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> getBookingDetails(String bookingId) async {
    try {
      final booking = await remoteDataSource.getBookingDetails(bookingId);
      return Right(booking.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> createBooking(CreateBookingRequestModel params) async {
    try {
      final booking = await remoteDataSource.createBooking(params);
      return Right(booking.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Booking>>> getMyBookings({required int page, int? limit}) async {
    try {
      final response = await remoteDataSource.getMyBookings(page: page, limit: limit);
      return Right(response.bookings.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelBooking(String bookingId) async {
    try {
      await remoteDataSource.cancelBooking(bookingId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
} 