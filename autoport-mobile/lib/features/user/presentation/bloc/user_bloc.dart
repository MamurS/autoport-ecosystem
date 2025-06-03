import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_profile_usecase.dart';
import '../../domain/usecases/update_user_profile_usecase.dart';
import '../../../../core/usecase/usecase.dart';

// Events
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUserProfileRequested extends UserEvent {
  const GetUserProfileRequested();
}

class UpdateUserProfileRequested extends UserEvent {
  final String name;
  final String? avatar;

  const UpdateUserProfileRequested({
    required this.name,
    this.avatar,
  });

  @override
  List<Object?> get props => [name, avatar];
}

// States
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateUserProfileUseCase updateUserProfileUseCase;

  UserBloc({
    required this.getUserProfileUseCase,
    required this.updateUserProfileUseCase,
  }) : super(const UserInitial()) {
    on<GetUserProfileRequested>(_onGetUserProfileRequested);
    on<UpdateUserProfileRequested>(_onUpdateUserProfileRequested);
  }

  Future<void> _onGetUserProfileRequested(
    GetUserProfileRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());

    final result = await getUserProfileUseCase(const NoParams());
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }

  Future<void> _onUpdateUserProfileRequested(
    UpdateUserProfileRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());

    final result = await updateUserProfileUseCase(UpdateProfileParams(
      name: event.name,
      avatar: event.avatar,
    ));
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
} 