part of 'car_bloc.dart';

@freezed
class CarEvent with _$CarEvent {
  const factory CarEvent.getMyCars() = _GetMyCars;
  const factory CarEvent.addCar(AddCarRequestModel request) = _AddCar;
  const factory CarEvent.updateCar(String carId, UpdateCarRequestModel request) = _UpdateCar;
  const factory CarEvent.deleteCar(String carId) = _DeleteCar;
} 