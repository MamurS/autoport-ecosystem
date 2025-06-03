import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/car.dart';
import '../repositories/car_repository.dart';

class GetMyCarsUseCase implements UseCase<List<Car>, NoParams> {
  final CarRepository repository;

  GetMyCarsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Car>>> call(NoParams params) async {
    return await repository.getMyCars();
  }
} 