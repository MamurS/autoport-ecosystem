import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../auth/domain/entities/user.dart';
import '../models/user_models.dart';
import '../datasources/user_remote_datasource.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getCurrentUserProfile() async {
    try {
      final response = await remoteDataSource.getCurrentUserProfile();
      return Right(response.user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserProfile(UpdateProfileRequestModel params) async {
    try {
      final response = await remoteDataSource.updateUserProfile(params);
      return Right(response.user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
} 