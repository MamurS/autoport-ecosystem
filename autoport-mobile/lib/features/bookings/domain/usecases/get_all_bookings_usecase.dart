import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class GetAllBookingsUseCase implements UseCase<List<Booking>, NoParams> {
  final BookingRepository repository;

  GetAllBookingsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Booking>>> call(NoParams params) async {
    return await repository.getAllBookings();
  }
} 