import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserProfileUseCase implements UseCase<User, NoParams> {
  final UserRepository userRepository;

  GetUserProfileUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await userRepository.getCurrentUser();
  }
} 