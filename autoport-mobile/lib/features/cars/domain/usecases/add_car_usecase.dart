import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/car.dart';
import '../repositories/car_repository.dart';

class AddCarParams extends Equatable {
  final String make;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final String? photo;

  const AddCarParams({
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    this.photo,
  });

  @override
  List<Object?> get props => [make, model, year, color, licensePlate, photo];
}

class AddCarUseCase implements UseCase<Car, AddCarParams> {
  final CarRepository repository;

  AddCarUseCase({required this.repository});

  @override
  Future<Either<Failure, Car>> call(AddCarParams params) async {
    return await repository.addCar(
      make: params.make,
      model: params.model,
      year: params.year,
      color: params.color,
      licensePlate: params.licensePlate,
      photo: params.photo,
    );
  }
} 