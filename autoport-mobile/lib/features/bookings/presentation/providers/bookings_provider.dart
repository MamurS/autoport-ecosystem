import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/booking_remote_datasource.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/usecases/cancel_booking_usecase.dart';
import '../../domain/usecases/create_booking_usecase.dart';
import '../../domain/usecases/get_active_bookings_usecase.dart';
import '../../domain/usecases/get_all_bookings_usecase.dart';
import '../../domain/usecases/get_booking_details_usecase.dart';
import '../../domain/usecases/get_my_bookings_usecase.dart';
import '../bloc/bookings_bloc.dart';
import '../../../../core/network/api_client.dart';

class BookingsProvider extends StatelessWidget {
  final Widget child;

  const BookingsProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BookingRemoteDataSource>(
          create: (context) => BookingRemoteDataSourceImpl(
            apiClient: context.read<ApiClient>(),
          ),
        ),
        RepositoryProvider<BookingRepositoryImpl>(
          create: (context) => BookingRepositoryImpl(
            remoteDataSource: context.read<BookingRemoteDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BookingsBloc>(
            create: (context) => BookingsBloc(
              getActiveBookingsUseCase: GetActiveBookingsUseCase(
                repository: context.read<BookingRepositoryImpl>(),
              ),
              getAllBookingsUseCase: GetAllBookingsUseCase(
                repository: context.read<BookingRepositoryImpl>(),
              ),
              getBookingDetailsUseCase: GetBookingDetailsUseCase(
                repository: context.read<BookingRepositoryImpl>(),
              ),
              createBookingUseCase: CreateBookingUseCase(
                repository: context.read<BookingRepositoryImpl>(),
              ),
              getMyBookingsUseCase: GetMyBookingsUseCase(
                repository: context.read<BookingRepositoryImpl>(),
              ),
              cancelBookingUseCase: CancelBookingUseCase(
                repository: context.read<BookingRepositoryImpl>(),
              ),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
} 