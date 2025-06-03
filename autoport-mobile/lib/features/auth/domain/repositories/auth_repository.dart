import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_result.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(String phoneNumber);
  Future<Either<Failure, AuthResult>> verifyOtp(String phoneNumber, String otp);
  Future<Either<Failure, AuthResult>> register(String phoneNumber, String otp, String name);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User?>> getCurrentUser();
  Future<bool> isAuthenticated();
} 