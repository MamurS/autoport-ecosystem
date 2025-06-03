import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/booking_repository.dart';

class CancelBookingParams {
  final String bookingId;

  const CancelBookingParams({required this.bookingId});
}

class CancelBookingUseCase implements UseCase<void, CancelBookingParams> {
  final BookingRepository repository;

  CancelBookingUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(CancelBookingParams params) async {
    return await repository.cancelBooking(params.bookingId);
  }
} 