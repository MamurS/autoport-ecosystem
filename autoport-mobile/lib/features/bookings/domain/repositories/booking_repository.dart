import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/booking.dart';
import '../../data/models/booking_models.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<Booking>>> getActiveBookings();
  Future<Either<Failure, List<Booking>>> getAllBookings();
  Future<Either<Failure, Booking>> getBookingDetails(String bookingId);
  Future<Either<Failure, Booking>> createBooking(CreateBookingRequestModel request);
  Future<Either<Failure, List<Booking>>> getMyBookings({required int page, int? limit});
  Future<Either<Failure, void>> cancelBooking(String bookingId);
} 