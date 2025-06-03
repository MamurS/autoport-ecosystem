import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/booking.dart';
import '../../domain/usecases/cancel_booking_usecase.dart';
import '../../domain/usecases/create_booking_usecase.dart';
import '../../domain/usecases/get_active_bookings_usecase.dart';
import '../../domain/usecases/get_all_bookings_usecase.dart';
import '../../domain/usecases/get_booking_details_usecase.dart';
import '../../domain/usecases/get_my_bookings_usecase.dart';
import '../../data/models/booking_models.dart';
import '../../../../core/usecases/usecase.dart';

// Events
abstract class BookingsEvent extends Equatable {
  const BookingsEvent();

  @override
  List<Object?> get props => [];
}

class FetchActiveBookings extends BookingsEvent {
  const FetchActiveBookings();
}

class FetchAllBookings extends BookingsEvent {
  const FetchAllBookings();
}

class FetchBookingDetails extends BookingsEvent {
  final String bookingId;

  const FetchBookingDetails(this.bookingId);

  @override
  List<Object?> get props => [bookingId];
}

class CreateBookingRequested extends BookingsEvent {
  final CreateBookingRequestModel request;

  const CreateBookingRequested(this.request);

  @override
  List<Object?> get props => [request];
}

class MyBookingsFetched extends BookingsEvent {
  final int page;
  final int? limit;

  const MyBookingsFetched({required this.page, this.limit});

  @override
  List<Object?> get props => [page, limit];
}

class CancelBookingRequested extends BookingsEvent {
  final String bookingId;

  const CancelBookingRequested(this.bookingId);

  @override
  List<Object?> get props => [bookingId];
}

// States
abstract class BookingsState extends Equatable {
  const BookingsState();

  @override
  List<Object?> get props => [];
}

class BookingsInitial extends BookingsState {
  const BookingsInitial();
}

class BookingsLoading extends BookingsState {
  const BookingsLoading();
}

class BookingsLoaded extends BookingsState {
  final List<Booking> bookings;

  const BookingsLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class BookingDetailsLoaded extends BookingsState {
  final Booking booking;

  const BookingDetailsLoaded(this.booking);

  @override
  List<Object?> get props => [booking];
}

class BookingSuccess extends BookingsState {
  final Booking booking;

  const BookingSuccess(this.booking);

  @override
  List<Object?> get props => [booking];
}

class ActiveBookingsLoaded extends BookingsState {
  final List<Booking> bookings;

  const ActiveBookingsLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class MyBookingsLoaded extends BookingsState {
  final List<Booking> bookings;
  final int page;
  final int total;

  const MyBookingsLoaded({
    required this.bookings,
    required this.page,
    required this.total,
  });

  @override
  List<Object?> get props => [bookings, page, total];
}

class BookingsError extends BookingsState {
  final String message;

  const BookingsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final GetActiveBookingsUseCase getActiveBookingsUseCase;
  final GetAllBookingsUseCase getAllBookingsUseCase;
  final GetBookingDetailsUseCase getBookingDetailsUseCase;
  final CreateBookingUseCase createBookingUseCase;
  final GetMyBookingsUseCase getMyBookingsUseCase;
  final CancelBookingUseCase cancelBookingUseCase;

  BookingsBloc({
    required this.getActiveBookingsUseCase,
    required this.getAllBookingsUseCase,
    required this.getBookingDetailsUseCase,
    required this.createBookingUseCase,
    required this.getMyBookingsUseCase,
    required this.cancelBookingUseCase,
  }) : super(const BookingsInitial()) {
    on<FetchActiveBookings>(_onFetchActiveBookings);
    on<FetchAllBookings>(_onFetchAllBookings);
    on<FetchBookingDetails>(_onFetchBookingDetails);
    on<CreateBookingRequested>(_onCreateBookingRequested);
    on<MyBookingsFetched>(_onMyBookingsFetched);
    on<CancelBookingRequested>(_onCancelBookingRequested);
  }

  Future<void> _onFetchActiveBookings(
    FetchActiveBookings event,
    Emitter<BookingsState> emit,
  ) async {
    emit(const BookingsLoading());

    final result = await getActiveBookingsUseCase(NoParams());
    result.fold(
      (failure) => emit(BookingsError(failure.message)),
      (bookings) => emit(ActiveBookingsLoaded(bookings)),
    );
  }

  Future<void> _onFetchAllBookings(
    FetchAllBookings event,
    Emitter<BookingsState> emit,
  ) async {
    emit(const BookingsLoading());

    final result = await getAllBookingsUseCase(NoParams());
    result.fold(
      (failure) => emit(BookingsError(failure.message)),
      (bookings) => emit(BookingsLoaded(bookings)),
    );
  }

  Future<void> _onFetchBookingDetails(
    FetchBookingDetails event,
    Emitter<BookingsState> emit,
  ) async {
    emit(const BookingsLoading());

    final result = await getBookingDetailsUseCase(GetBookingDetailsParams(
      bookingId: event.bookingId,
    ));
    result.fold(
      (failure) => emit(BookingsError(failure.message)),
      (booking) => emit(BookingDetailsLoaded(booking)),
    );
  }

  Future<void> _onCreateBookingRequested(
    CreateBookingRequested event,
    Emitter<BookingsState> emit,
  ) async {
    emit(const BookingsLoading());

    final result = await createBookingUseCase(event.request);
    result.fold(
      (failure) => emit(BookingsError(failure.message)),
      (booking) => emit(BookingSuccess(booking)),
    );
  }

  Future<void> _onMyBookingsFetched(
    MyBookingsFetched event,
    Emitter<BookingsState> emit,
  ) async {
    emit(const BookingsLoading());

    final result = await getMyBookingsUseCase(MyBookingsParams(
      page: event.page,
      limit: event.limit,
    ));
    result.fold(
      (failure) => emit(BookingsError(failure.message)),
      (bookings) => emit(MyBookingsLoaded(
        bookings: bookings,
        page: event.page,
        total: bookings.length,
      )),
    );
  }

  Future<void> _onCancelBookingRequested(
    CancelBookingRequested event,
    Emitter<BookingsState> emit,
  ) async {
    emit(const BookingsLoading());

    final result = await cancelBookingUseCase(CancelBookingParams(
      bookingId: event.bookingId,
    ));
    result.fold(
      (failure) => emit(BookingsError(failure.message)),
      (_) => add(const FetchActiveBookings()),
    );
  }
} 