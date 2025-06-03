import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/booking.dart';
import '../repositories/booking_repository.dart';

class MyBookingsParams {
  final int page;
  final int? limit;

  const MyBookingsParams({
    required this.page,
    this.limit,
  });
}

class GetMyBookingsUseCase implements UseCase<List<Booking>, MyBookingsParams> {
  final BookingRepository repository;

  GetMyBookingsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Booking>>> call(MyBookingsParams params) async {
    return await repository.getMyBookings(
      page: params.page,
      limit: params.limit,
    );
  }
} 