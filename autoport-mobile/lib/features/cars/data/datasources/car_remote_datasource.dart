import '../../../../core/network/api_client.dart';
import '../../domain/entities/car.dart';

abstract class CarRemoteDataSource {
  Future<List<Car>> getMyCars();
  Future<Car> addCar({
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  });
  Future<Car> updateCar({
    required String id,
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  });
  Future<void> deleteCar(String id);
}

class CarRemoteDataSourceImpl implements CarRemoteDataSource {
  final ApiClient apiClient;

  CarRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<Car>> getMyCars() async {
    final response = await apiClient.get('/cars');
    return (response.data['data'] as List)
        .map((json) => Car.fromJson(json))
        .toList();
  }

  @override
  Future<Car> addCar({
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  }) async {
    final response = await apiClient.post(
      '/cars',
      data: {
        'make': make,
        'model': model,
        'year': year,
        'color': color,
        'licensePlate': licensePlate,
        if (photo != null) 'photo': photo,
      },
    );
    return Car.fromJson(response.data['data']);
  }

  @override
  Future<Car> updateCar({
    required String id,
    required String make,
    required String model,
    required int year,
    required String color,
    required String licensePlate,
    String? photo,
  }) async {
    final response = await apiClient.put(
      '/cars/$id',
      data: {
        'make': make,
        'model': model,
        'year': year,
        'color': color,
        'licensePlate': licensePlate,
        if (photo != null) 'photo': photo,
      },
    );
    return Car.fromJson(response.data['data']);
  }

  @override
  Future<void> deleteCar(String id) async {
    await apiClient.delete('/cars/$id');
  }
} 