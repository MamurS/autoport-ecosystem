import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/car_repository.dart';

class DeleteCarUseCase implements UseCase<void, String> {
  final CarRepository repository;

  DeleteCarUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String carId) async {
    return await repository.deleteCar(carId);
  }
} 