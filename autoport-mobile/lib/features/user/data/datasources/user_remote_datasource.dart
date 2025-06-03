import '../models/user_models.dart';
import '../../../../core/network/api_client.dart';

abstract class UserRemoteDataSource {
  Future<UserResponse> getCurrentUserProfile();
  Future<UserResponse> updateUserProfile(UpdateProfileRequestModel params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;
  UserRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserResponse> getCurrentUserProfile() async {
    final response = await apiClient.getCurrentUserProfile();
    return UserResponse.fromJson(response);
  }

  @override
  Future<UserResponse> updateUserProfile(UpdateProfileRequestModel params) async {
    final response = await apiClient.updateUserProfile(params.toJson());
    return UserResponse.fromJson(response);
  }
} 