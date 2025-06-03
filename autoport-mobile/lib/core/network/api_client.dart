import 'package:dio/dio.dart';

part 'api_client.g.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return await dio.put(path, data: data);
  }

  Future<Response> delete(String path) async {
    return await dio.delete(path);
  }

  // Auth endpoints
  Future<Map<String, dynamic>> login(String phone, String code) async {
    final response = await dio.post('/auth/login', data: {
      'phone': phone,
      'code': code,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> register(String phone, String code, String name) async {
    final response = await dio.post('/auth/register', data: {
      'phone': phone,
      'code': code,
      'name': name,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> sendVerificationCode(String phone) async {
    final response = await dio.post('/auth/send-code', data: {
      'phone': phone,
    });
    return response.data;
  }

  // Trip endpoints
  Future<Map<String, dynamic>> searchTrips(Map<String, dynamic> params) async {
    final response = await dio.get('/trips/search', queryParameters: params);
    return response.data;
  }

  Future<Map<String, dynamic>> getTripDetails(String tripId) async {
    final response = await dio.get('/trips/$tripId');
    return response.data;
  }

  Future<Map<String, dynamic>> createTrip(Map<String, dynamic> data) async {
    final response = await dio.post('/trips', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> updateTrip(String tripId, Map<String, dynamic> data) async {
    final response = await dio.put('/trips/$tripId', data: data);
    return response.data;
  }

  Future<void> cancelTrip(String tripId) async {
    await dio.delete('/trips/$tripId');
  }

  Future<Map<String, dynamic>> getMyTrips(Map<String, dynamic> params) async {
    final response = await dio.get('/trips/my', queryParameters: params);
    return response.data;
  }

  // Booking endpoints
  Future<List<Map<String, dynamic>>> getActiveBookings() async {
    final response = await dio.get('/bookings/active');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<List<Map<String, dynamic>>> getAllBookings() async {
    final response = await dio.get('/bookings');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> getBookingDetails(String bookingId) async {
    final response = await dio.get('/bookings/$bookingId');
    return response.data;
  }

  Future<Map<String, dynamic>> createBooking(String tripId, int seats) async {
    final response = await dio.post('/bookings', data: {
      'trip_id': tripId,
      'seats': seats,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> getMyBookings(Map<String, dynamic> params) async {
    final response = await dio.get('/bookings/my', queryParameters: params);
    return response.data;
  }

  Future<void> cancelBooking(String bookingId) async {
    await dio.delete('/bookings/$bookingId');
  }

  // User endpoints
  Future<Map<String, dynamic>> getCurrentUserProfile() async {
    final response = await dio.get('/users/me');
    return response.data;
  }

  Future<Map<String, dynamic>> updateUserProfile(Map<String, dynamic> data) async {
    final response = await dio.put('/users/me', data: data);
    return response.data;
  }

  // Car endpoints
  Future<Map<String, dynamic>> addCar(Map<String, dynamic> data) async {
    final response = await dio.post('/cars', data: data);
    return response.data;
  }

  Future<List<Map<String, dynamic>>> getMyCars() async {
    final response = await dio.get('/cars/my');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> updateCar(String carId, Map<String, dynamic> data) async {
    final response = await dio.put('/cars/$carId', data: data);
    return response.data;
  }

  Future<void> deleteCar(String carId) async {
    await dio.delete('/cars/$carId');
  }
} 