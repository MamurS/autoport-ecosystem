import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/car.dart';
import '../../domain/usecases/get_my_cars_usecase.dart';
import '../../domain/usecases/add_car_usecase.dart';
import '../../domain/usecases/update_car_usecase.dart';
import '../../domain/usecases/delete_car_usecase.dart';
import '../../../../core/usecase/usecase.dart';

// Events
abstract class CarsEvent extends Equatable {
  const CarsEvent();

  @override
  List<Object?> get props => [];
}

class GetMyCarsRequested extends CarsEvent {
  const GetMyCarsRequested();
}

class AddCarRequested extends CarsEvent {
  final String make;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final String? photo;

  const AddCarRequested({
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    this.photo,
  });

  @override
  List<Object?> get props => [make, model, year, color, licensePlate, photo];
}

class UpdateCarRequested extends CarsEvent {
  final String id;
  final String make;
  final String model;
  final int year;
  final String color;
  final String licensePlate;
  final String? photo;

  const UpdateCarRequested({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.licensePlate,
    this.photo,
  });

  @override
  List<Object?> get props => [id, make, model, year, color, licensePlate, photo];
}

class DeleteCarRequested extends CarsEvent {
  final String id;

  const DeleteCarRequested(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class CarsState extends Equatable {
  const CarsState();

  @override
  List<Object?> get props => [];
}

class CarsInitial extends CarsState {
  const CarsInitial();
}

class CarsLoading extends CarsState {
  const CarsLoading();
}

class CarsLoaded extends CarsState {
  final List<Car> cars;

  const CarsLoaded(this.cars);

  @override
  List<Object?> get props => [cars];
}

class CarsError extends CarsState {
  final String message;

  const CarsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final GetMyCarsUseCase getMyCarsUseCase;
  final AddCarUseCase addCarUseCase;
  final UpdateCarUseCase updateCarUseCase;
  final DeleteCarUseCase deleteCarUseCase;

  CarsBloc({
    required this.getMyCarsUseCase,
    required this.addCarUseCase,
    required this.updateCarUseCase,
    required this.deleteCarUseCase,
  }) : super(const CarsInitial()) {
    on<GetMyCarsRequested>(_onGetMyCarsRequested);
    on<AddCarRequested>(_onAddCarRequested);
    on<UpdateCarRequested>(_onUpdateCarRequested);
    on<DeleteCarRequested>(_onDeleteCarRequested);
  }

  Future<void> _onGetMyCarsRequested(
    GetMyCarsRequested event,
    Emitter<CarsState> emit,
  ) async {
    emit(const CarsLoading());

    final result = await getMyCarsUseCase(const NoParams());
    result.fold(
      (failure) => emit(CarsError(failure.message)),
      (cars) => emit(CarsLoaded(cars)),
    );
  }

  Future<void> _onAddCarRequested(
    AddCarRequested event,
    Emitter<CarsState> emit,
  ) async {
    emit(const CarsLoading());

    final result = await addCarUseCase(AddCarParams(
      make: event.make,
      model: event.model,
      year: event.year,
      color: event.color,
      licensePlate: event.licensePlate,
      photo: event.photo,
    ));
    result.fold(
      (failure) => emit(CarsError(failure.message)),
      (car) => add(GetMyCarsRequested()),
    );
  }

  Future<void> _onUpdateCarRequested(
    UpdateCarRequested event,
    Emitter<CarsState> emit,
  ) async {
    emit(const CarsLoading());

    final result = await updateCarUseCase(UpdateCarParams(
      id: event.id,
      make: event.make,
      model: event.model,
      year: event.year,
      color: event.color,
      licensePlate: event.licensePlate,
      photo: event.photo,
    ));
    result.fold(
      (failure) => emit(CarsError(failure.message)),
      (car) => add(GetMyCarsRequested()),
    );
  }

  Future<void> _onDeleteCarRequested(
    DeleteCarRequested event,
    Emitter<CarsState> emit,
  ) async {
    emit(const CarsLoading());

    final result = await deleteCarUseCase(event.id);
    result.fold(
      (failure) => emit(CarsError(failure.message)),
      (_) => add(GetMyCarsRequested()),
    );
  }
} 