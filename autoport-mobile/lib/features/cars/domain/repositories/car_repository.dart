import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/car.dart';

abstract class CarRepository {
  Future<Either<Failure, List<Car>>> getMyCars();
  Future<Either<Failure, Car>> addCar({
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  });
  Future<Either<Failure, Car>> updateCar({
    required String id,
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  });
  Future<Either<Failure, void>> deleteCar(String id);
} 