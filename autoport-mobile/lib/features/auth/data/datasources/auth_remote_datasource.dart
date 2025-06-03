import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../models/auth_models.dart';

abstract class AuthRemoteDataSource {
  Future<void> login(String phoneNumber);
  Future<AuthResultModel> verifyOtp(String phoneNumber, String otp);
  Future<AuthResultModel> register(String phoneNumber, String otp, String name);
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  
  AuthRemoteDataSourceImpl({required this.apiClient});
  
  @override
  Future<void> login(String phoneNumber) async {
    await apiClient.requestLoginOTP({'phone_number': phoneNumber});
  }
  
  @override
  Future<AuthResultModel> verifyOtp(String phoneNumber, String otp) async {
    final response = await apiClient.verifyLoginOTP({
      'phone_number': phoneNumber,
      'otp': otp,
    });
    return AuthResultModel.fromJson(response);
  }
  
  @override
  Future<AuthResultModel> register(String phoneNumber, String otp, String name) async {
    final response = await apiClient.registerDriver({
      'phone_number': phoneNumber,
      'otp': otp,
      'name': name,
    });
    return AuthResultModel.fromJson(response);
  }
  
  @override
  Future<void> logout() async {
    // Implement logout logic if needed
  }
  
  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await apiClient.getUserProfile();
      return UserModel.fromJson(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return null;
      }
      rethrow;
    }
  }
} 