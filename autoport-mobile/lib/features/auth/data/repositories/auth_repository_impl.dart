import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SharedPreferences sharedPreferences;
  
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.sharedPreferences,
  });
  
  @override
  Future<Either<Failure, void>> login(String phoneNumber) async {
    try {
      await remoteDataSource.login(phoneNumber);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AuthResult>> verifyOtp(String phoneNumber, String otp) async {
    try {
      final authResult = await remoteDataSource.verifyOtp(phoneNumber, otp);
      await _saveAuthResult(authResult);
      return Right(authResult);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AuthResult>> register(String phoneNumber, String otp, String name) async {
    try {
      final authResult = await remoteDataSource.register(phoneNumber, otp, name);
      await _saveAuthResult(authResult);
      return Right(authResult);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await _clearAuthData();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<bool> isAuthenticated() async {
    return sharedPreferences.containsKey(AppConstants.tokenKey);
  }
  
  Future<void> _saveAuthResult(AuthResult authResult) async {
    await sharedPreferences.setString(AppConstants.tokenKey, authResult.accessToken);
    await sharedPreferences.setString(AppConstants.refreshTokenKey, authResult.refreshToken);
    await sharedPreferences.setString(AppConstants.userKey, authResult.user.toString());
  }
  
  Future<void> _clearAuthData() async {
    await sharedPreferences.remove(AppConstants.tokenKey);
    await sharedPreferences.remove(AppConstants.refreshTokenKey);
    await sharedPreferences.remove(AppConstants.userKey);
  }
} 