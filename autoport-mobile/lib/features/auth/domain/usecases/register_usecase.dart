import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

class RegisterParams extends Equatable {
  final String phoneNumber;
  final String otp;
  final String name;
  
  const RegisterParams({
    required this.phoneNumber,
    required this.otp,
    required this.name,
  });
  
  @override
  List<Object> get props => [phoneNumber, otp, name];
}

class RegisterUseCase implements UseCase<AuthResult, RegisterParams> {
  final AuthRepository repository;
  
  RegisterUseCase({required this.repository});
  
  @override
  Future<Either<Failure, AuthResult>> call(RegisterParams params) async {
    return await repository.register(params.phoneNumber, params.otp, params.name);
  }
} 