import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/car.dart';
import '../repositories/car_repository.dart';

class UpdateCarParams extends Equatable {
  final String id;
  final String make;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final String? photo;

  const UpdateCarParams({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    this.photo,
  });

  @override
  List<Object?> get props => [id, make, model, year, color, licensePlate, photo];
}

class UpdateCarUseCase implements UseCase<Car, UpdateCarParams> {
  final CarRepository repository;

  UpdateCarUseCase({required this.repository});

  @override
  Future<Either<Failure, Car>> call(UpdateCarParams params) async {
    return await repository.updateCar(
      id: params.id,
      make: params.make,
      model: params.model,
      year: params.year,
      color: params.color,
      licensePlate: params.licensePlate,
      photo: params.photo,
    );
  }
} 