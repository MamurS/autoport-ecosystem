import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/repositories/auth_repository.dart';

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class LoginRequested extends AuthEvent {
  final String phoneNumber;
  
  const LoginRequested(this.phoneNumber);
  
  @override
  List<Object?> get props => [phoneNumber];
}

class RegisterRequested extends AuthEvent {
  final String phoneNumber;
  final String otp;
  final String name;
  
  const RegisterRequested(this.phoneNumber, this.otp, this.name);
  
  @override
  List<Object?> get props => [phoneNumber, otp, name];
}

class OtpVerificationRequested extends AuthEvent {
  final String phoneNumber;
  final String otp;
  
  const OtpVerificationRequested(this.phoneNumber, this.otp);
  
  @override
  List<Object?> get props => [phoneNumber, otp];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

// States
abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final User user;
  
  const AuthAuthenticated(this.user);
  
  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthOtpSent extends AuthState {
  final String phoneNumber;
  
  const AuthOtpSent(this.phoneNumber);
  
  @override
  List<Object?> get props => [phoneNumber];
}

class AuthError extends AuthState {
  final String message;
  
  const AuthError(this.message);
  
  @override
  List<Object?> get props => [message];
}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyOTPUseCase verifyOtpUseCase;
  
  AuthBloc({
    required this.authRepository,
    required this.loginUseCase,
    required this.registerUseCase,
    required this.verifyOtpUseCase,
  }) : super(const AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<OtpVerificationRequested>(_onOtpVerificationRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }
  
  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    final result = await authRepository.getCurrentUser();
    result.fold(
      (failure) => emit(const AuthUnauthenticated()),
      (user) => user != null
          ? emit(AuthAuthenticated(user))
          : emit(const AuthUnauthenticated()),
    );
  }
  
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    final result = await loginUseCase(LoginParams(phoneNumber: event.phoneNumber));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthOtpSent(event.phoneNumber)),
    );
  }
  
  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    final result = await registerUseCase(RegisterParams(
      phoneNumber: event.phoneNumber,
      otp: event.otp,
      name: event.name,
    ));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (authResult) => emit(AuthAuthenticated(authResult.user)),
    );
  }
  
  Future<void> _onOtpVerificationRequested(
    OtpVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    final result = await verifyOtpUseCase(VerifyOtpParams(
      phoneNumber: event.phoneNumber,
      otp: event.otp,
    ));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (authResult) => emit(AuthAuthenticated(authResult.user)),
    );
  }
  
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    final result = await authRepository.logout();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(const AuthUnauthenticated()),
    );
  }
} 