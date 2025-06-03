import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/car.dart';
import '../../domain/repositories/car_repository.dart';
import '../datasources/car_remote_datasource.dart';
import '../models/car_models.dart';

class CarRepositoryImpl implements CarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Car>>> getMyCars() async {
    try {
      final cars = await remoteDataSource.getMyCars();
      return right(cars);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Car>> addCar({
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  }) async {
    try {
      final car = await remoteDataSource.addCar(
        make: make,
        model: model,
        year: year,
        color: color,
        licensePlate: licensePlate,
        photo: photo,
      );
      return right(car);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Car>> updateCar({
    required String id,
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  }) async {
    try {
      final car = await remoteDataSource.updateCar(
        id: id,
        make: make,
        model: model,
        year: year,
        color: color,
        licensePlate: licensePlate,
        photo: photo,
      );
      return right(car);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCar(String id) async {
    try {
      await remoteDataSource.deleteCar(id);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
} 