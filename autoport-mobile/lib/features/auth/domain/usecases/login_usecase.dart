import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class LoginParams extends Equatable {
  final String phoneNumber;
  
  const LoginParams({required this.phoneNumber});
  
  @override
  List<Object> get props => [phoneNumber];
}

class LoginUseCase implements UseCase<void, LoginParams> {
  final AuthRepository repository;
  
  LoginUseCase({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await repository.login(params.phoneNumber);
  }
} 