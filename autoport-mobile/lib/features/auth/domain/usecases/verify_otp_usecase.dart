import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

class VerifyOtpParams extends Equatable {
  final String phoneNumber;
  final String otp;
  
  const VerifyOtpParams({
    required this.phoneNumber,
    required this.otp,
  });
  
  @override
  List<Object> get props => [phoneNumber, otp];
}

class VerifyOTPUseCase implements UseCase<AuthResult, VerifyOtpParams> {
  final AuthRepository repository;
  
  VerifyOTPUseCase({required this.repository});
  
  @override
  Future<Either<Failure, AuthResult>> call(VerifyOtpParams params) async {
    return await repository.verifyOtp(params.phoneNumber, params.otp);
  }
} 