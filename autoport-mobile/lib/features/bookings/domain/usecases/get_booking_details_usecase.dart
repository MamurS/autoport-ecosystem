import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetBookingDetailsParams extends Equatable {
  final String bookingId;

  const GetBookingDetailsParams({required this.bookingId});

  @override
  List<Object?> get props => [bookingId];
}

class GetBookingDetailsUseCase implements UseCase<Booking, GetBookingDetailsParams> {
  final BookingRepository repository;

  GetBookingDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, Booking>> call(GetBookingDetailsParams params) async {
    return await repository.getBookingDetails(params.bookingId);
  }
} 