import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/trip_repository.dart';

class CancelTripUseCase implements UseCase<void, String> {
  final TripRepository repository;

  const CancelTripUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String tripId) async {
    return await repository.cancelTrip(tripId);
  }
} 