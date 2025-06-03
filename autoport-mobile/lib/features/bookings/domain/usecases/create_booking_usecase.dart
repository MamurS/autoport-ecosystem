import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/booking.dart';
import '../repositories/booking_repository.dart';
import '../../data/models/booking_models.dart';

class CreateBookingUseCase implements UseCase<Booking, CreateBookingRequestModel> {
  final BookingRepository repository;

  CreateBookingUseCase({required this.repository});

  @override
  Future<Either<Failure, Booking>> call(CreateBookingRequestModel params) async {
    return await repository.createBooking(params);
  }
} 