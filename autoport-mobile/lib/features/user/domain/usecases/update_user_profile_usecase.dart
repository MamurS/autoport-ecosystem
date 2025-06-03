import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateProfileParams extends Equatable {
  final String name;
  final String? avatar;

  const UpdateProfileParams({
    required this.name,
    this.avatar,
  });

  @override
  List<Object?> get props => [name, avatar];
}

class UpdateUserProfileUseCase implements UseCase<User, UpdateProfileParams> {
  final UserRepository userRepository;

  UpdateUserProfileUseCase({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) async {
    return await userRepository.updateProfile(params.name, params.avatar);
  }
} 