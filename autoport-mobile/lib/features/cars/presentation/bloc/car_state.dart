part of 'car_bloc.dart';

enum CarStatus { initial, loading, success, error }

@freezed
class CarState with _$CarState {
  const factory CarState({
    @Default(CarStatus.initial) CarStatus status,
    @Default([]) List<Car> cars,
    String? errorMessage,
  }) = _CarState;
} 