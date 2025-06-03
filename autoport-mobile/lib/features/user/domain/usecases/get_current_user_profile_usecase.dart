import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../auth/domain/entities/user.dart';
import '../repositories/user_repository.dart';

class GetCurrentUserProfileUseCase implements UseCase<User, NoParams> {
  final UserRepository repository;
  GetCurrentUserProfileUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.getCurrentUserProfile();
  }
} 