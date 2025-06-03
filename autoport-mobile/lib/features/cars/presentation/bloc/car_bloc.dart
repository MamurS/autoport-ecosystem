import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/car.dart';
import '../../domain/usecases/add_car_usecase.dart';
import '../../domain/usecases/delete_car_usecase.dart';
import '../../domain/usecases/get_my_cars_usecase.dart';
import '../../domain/usecases/update_car_usecase.dart';
import '../../data/models/car_models.dart';

part 'car_event.dart';
part 'car_state.dart';
part 'car_bloc.freezed.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetMyCarsUseCase getMyCarsUseCase;
  final AddCarUseCase addCarUseCase;
  final UpdateCarUseCase updateCarUseCase;
  final DeleteCarUseCase deleteCarUseCase;

  CarBloc({
    required this.getMyCarsUseCase,
    required this.addCarUseCase,
    required this.updateCarUseCase,
    required this.deleteCarUseCase,
  }) : super(const CarState()) {
    on<CarEvent>((event, emit) async {
      await event.map(
        getMyCars: (e) => _onGetMyCars(e, emit),
        addCar: (e) => _onAddCar(e, emit),
        updateCar: (e) => _onUpdateCar(e, emit),
        deleteCar: (e) => _onDeleteCar(e, emit),
      );
    });
  }

  Future<void> _onGetMyCars(_GetMyCars event, Emitter<CarState> emit) async {
    emit(state.copyWith(status: CarStatus.loading));

    final result = await getMyCarsUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(
        status: CarStatus.error,
        errorMessage: failure.message,
      )),
      (cars) => emit(state.copyWith(
        status: CarStatus.success,
        cars: cars,
      )),
    );
  }

  Future<void> _onAddCar(_AddCar event, Emitter<CarState> emit) async {
    emit(state.copyWith(status: CarStatus.loading));

    final result = await addCarUseCase(event.request);

    result.fold(
      (failure) => emit(state.copyWith(
        status: CarStatus.error,
        errorMessage: failure.message,
      )),
      (car) => emit(state.copyWith(
        status: CarStatus.success,
        cars: [...state.cars, car],
      )),
    );
  }

  Future<void> _onUpdateCar(_UpdateCar event, Emitter<CarState> emit) async {
    emit(state.copyWith(status: CarStatus.loading));

    final result = await updateCarUseCase(
      UpdateCarParams(carId: event.carId, request: event.request),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: CarStatus.error,
        errorMessage: failure.message,
      )),
      (updatedCar) => emit(state.copyWith(
        status: CarStatus.success,
        cars: state.cars.map((car) {
          return car.id == updatedCar.id ? updatedCar : car;
        }).toList(),
      )),
    );
  }

  Future<void> _onDeleteCar(_DeleteCar event, Emitter<CarState> emit) async {
    emit(state.copyWith(status: CarStatus.loading));

    final result = await deleteCarUseCase(event.carId);

    result.fold(
      (failure) => emit(state.copyWith(
        status: CarStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: CarStatus.success,
        cars: state.cars.where((car) => car.id != event.carId).toList(),
      )),
    );
  }
} 