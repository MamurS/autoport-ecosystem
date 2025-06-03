import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/search_trips_usecase.dart';
import '../../domain/usecases/get_trip_details_usecase.dart';
import '../../domain/usecases/create_trip_usecase.dart';
import '../../domain/usecases/get_my_trips_usecase.dart';
import '../../domain/usecases/update_trip_usecase.dart';
import '../../domain/usecases/cancel_trip_usecase.dart';
import '../../domain/entities/trip.dart';
import '../../domain/entities/search_result_entity.dart';
import '../../domain/entities/search_params.dart';
import '../../data/models/trip_models.dart';
import '../../../../core/usecase/usecase.dart';

// Events
abstract class TripsEvent extends Equatable {
  const TripsEvent();

  @override
  List<Object?> get props => [];
}

class SearchTripsRequested extends TripsEvent {
  final String fromCity;
  final String toCity;
  final DateTime date;

  const SearchTripsRequested({
    required this.fromCity,
    required this.toCity,
    required this.date,
  });

  @override
  List<Object?> get props => [fromCity, toCity, date];
}

class GetTripDetailsRequested extends TripsEvent {
  final String tripId;

  const GetTripDetailsRequested(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

class CreateTripRequested extends TripsEvent {
  final String carId;
  final String fromCity;
  final String toCity;
  final DateTime departureTime;
  final int availableSeats;
  final double price;

  const CreateTripRequested({
    required this.carId,
    required this.fromCity,
    required this.toCity,
    required this.departureTime,
    required this.availableSeats,
    required this.price,
  });

  @override
  List<Object?> get props => [
    carId,
    fromCity,
    toCity,
    departureTime,
    availableSeats,
    price,
  ];
}

class GetMyTripsRequested extends TripsEvent {
  const GetMyTripsRequested();
}

class UpdateTripRequested extends TripsEvent {
  final String id;
  final String carId;
  final String fromCity;
  final String toCity;
  final DateTime departureTime;
  final int availableSeats;
  final double price;

  const UpdateTripRequested({
    required this.id,
    required this.carId,
    required this.fromCity,
    required this.toCity,
    required this.departureTime,
    required this.availableSeats,
    required this.price,
  });

  @override
  List<Object?> get props => [
    id,
    carId,
    fromCity,
    toCity,
    departureTime,
    availableSeats,
    price,
  ];
}

class CancelTripRequested extends TripsEvent {
  final String tripId;

  const CancelTripRequested(this.tripId);

  @override
  List<Object?> get props => [tripId];
}

// States
abstract class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object?> get props => [];
}

class TripsInitial extends TripsState {
  const TripsInitial();
}

class TripsLoading extends TripsState {
  const TripsLoading();
}

class TripsLoaded extends TripsState {
  final List<Trip> trips;

  const TripsLoaded(this.trips);

  @override
  List<Object?> get props => [trips];
}

class TripDetailsLoaded extends TripsState {
  final Trip trip;

  const TripDetailsLoaded(this.trip);

  @override
  List<Object?> get props => [trip];
}

class TripsError extends TripsState {
  final String message;

  const TripsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final SearchTripsUseCase searchTripsUseCase;
  final GetTripDetailsUseCase getTripDetailsUseCase;
  final CreateTripUseCase createTripUseCase;
  final GetMyTripsUseCase getMyTripsUseCase;
  final UpdateTripUseCase updateTripUseCase;
  final CancelTripUseCase cancelTripUseCase;

  SearchTripsParams? _lastSearchParams;

  TripsBloc({
    required this.searchTripsUseCase,
    required this.getTripDetailsUseCase,
    required this.createTripUseCase,
    required this.getMyTripsUseCase,
    required this.updateTripUseCase,
    required this.cancelTripUseCase,
  }) : super(const TripsInitial()) {
    on<SearchTripsRequested>(_onSearchTripsRequested);
    on<GetTripDetailsRequested>(_onGetTripDetailsRequested);
    on<CreateTripRequested>(_onCreateTripRequested);
    on<GetMyTripsRequested>(_onGetMyTripsRequested);
    on<UpdateTripRequested>(_onUpdateTripRequested);
    on<CancelTripRequested>(_onCancelTripRequested);
  }

  Future<void> _onSearchTripsRequested(
    SearchTripsRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(const TripsLoading());

    final params = SearchTripsParams(
      from: event.fromCity,
      to: event.toCity,
      date: event.date,
      seats: 1,
      page: 1,
    );
    _lastSearchParams = params;

    final result = await searchTripsUseCase(params);
    result.fold(
      (failure) => emit(TripsError(failure.message)),
      (searchResult) => emit(TripsLoaded(searchResult.trips)),
    );
  }

  Future<void> _onGetTripDetailsRequested(
    GetTripDetailsRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(const TripsLoading());

    final result = await getTripDetailsUseCase(event.tripId);
    result.fold(
      (failure) => emit(TripsError(failure.message)),
      (trip) => emit(TripDetailsLoaded(trip)),
    );
  }

  Future<void> _onCreateTripRequested(
    CreateTripRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(const TripsLoading());

    final result = await createTripUseCase(CreateTripRequest(
      fromLocation: event.fromCity,
      toLocation: event.toCity,
      departureDateTime: event.departureTime,
      totalSeats: event.availableSeats,
      pricePerSeat: event.price,
    ));
    result.fold(
      (failure) => emit(TripsError(failure.message)),
      (trip) => add(GetMyTripsRequested()),
    );
  }

  Future<void> _onGetMyTripsRequested(
    GetMyTripsRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(const TripsLoading());

    final result = await getMyTripsUseCase(const MyTripsParams(
      page: 1,
      limit: 10,
    ));
    result.fold(
      (failure) => emit(TripsError(failure.message)),
      (searchResult) => emit(TripsLoaded(searchResult.trips)),
    );
  }

  Future<void> _onUpdateTripRequested(
    UpdateTripRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(const TripsLoading());

    final result = await updateTripUseCase(UpdateTripParams(
      tripId: event.id,
      request: UpdateTripRequest(
        fromLocation: event.fromCity,
        toLocation: event.toCity,
        departureDateTime: event.departureTime,
        totalSeats: event.availableSeats,
        pricePerSeat: event.price,
      ),
    ));
    result.fold(
      (failure) => emit(TripsError(failure.message)),
      (trip) => add(GetMyTripsRequested()),
    );
  }

  Future<void> _onCancelTripRequested(
    CancelTripRequested event,
    Emitter<TripsState> emit,
  ) async {
    emit(const TripsLoading());

    final result = await cancelTripUseCase(event.tripId);
    result.fold(
      (failure) => emit(TripsError(failure.message)),
      (_) => add(GetMyTripsRequested()),
    );
  }
} 