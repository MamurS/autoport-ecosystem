import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Core
import '../network/dio_client.dart';
import '../network/api_client.dart';

// Auth Feature
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/verify_otp_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

// User Feature
import '../../features/user/data/datasources/user_remote_datasource.dart';
import '../../features/user/data/repositories/user_repository_impl.dart';
import '../../features/user/domain/repositories/user_repository.dart';
import '../../features/user/domain/usecases/get_user_profile_usecase.dart';
import '../../features/user/domain/usecases/update_user_profile_usecase.dart';
import '../../features/user/presentation/bloc/user_bloc.dart';

// Trips Feature
import '../../features/trips/data/datasources/trip_remote_datasource.dart';
import '../../features/trips/data/repositories/trip_repository_impl.dart';
import '../../features/trips/domain/repositories/trip_repository.dart';
import '../../features/trips/domain/usecases/search_trips_usecase.dart';
import '../../features/trips/domain/usecases/get_trip_details_usecase.dart';
import '../../features/trips/domain/usecases/create_trip_usecase.dart';
import '../../features/trips/domain/usecases/get_my_trips_usecase.dart';
import '../../features/trips/domain/usecases/update_trip_usecase.dart';
import '../../features/trips/domain/usecases/cancel_trip_usecase.dart';
import '../../features/trips/presentation/bloc/trips_bloc.dart';

// Cars Feature
import '../../features/cars/data/datasources/car_remote_datasource.dart';
import '../../features/cars/data/repositories/car_repository_impl.dart';
import '../../features/cars/domain/repositories/car_repository.dart';
import '../../features/cars/domain/usecases/get_my_cars_usecase.dart';
import '../../features/cars/domain/usecases/add_car_usecase.dart';
import '../../features/cars/domain/usecases/update_car_usecase.dart';
import '../../features/cars/domain/usecases/delete_car_usecase.dart';
import '../../features/cars/presentation/bloc/cars_bloc.dart';

// Bookings Feature
import '../../features/bookings/data/datasources/booking_remote_datasource.dart';
import '../../features/bookings/data/repositories/booking_repository_impl.dart';
import '../../features/bookings/domain/repositories/booking_repository.dart';
import '../../features/bookings/domain/usecases/get_active_bookings_usecase.dart';
import '../../features/bookings/domain/usecases/get_all_bookings_usecase.dart';
import '../../features/bookings/domain/usecases/get_booking_details_usecase.dart';
import '../../features/bookings/domain/usecases/create_booking_usecase.dart';
import '../../features/bookings/domain/usecases/get_my_bookings_usecase.dart';
import '../../features/bookings/domain/usecases/cancel_booking_usecase.dart';
import '../../features/bookings/presentation/bloc/bookings_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt()));
  
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Auth Feature
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      sharedPreferences: getIt(),
    ),
  );
  getIt.registerLazySingleton(() => LoginUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => VerifyOTPUseCase(repository: getIt()));
  getIt.registerFactory(
    () => AuthBloc(
      authRepository: getIt(),
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      verifyOtpUseCase: getIt(),
    ),
  );

  // User Feature
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton(() => GetUserProfileUseCase(userRepository: getIt()));
  getIt.registerLazySingleton(() => UpdateUserProfileUseCase(userRepository: getIt()));
  getIt.registerFactory(() => UserBloc(
    getUserProfileUseCase: getIt(),
    updateUserProfileUseCase: getIt(),
  ));

  // Trips Feature
  getIt.registerLazySingleton<TripRemoteDataSource>(
    () => TripRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<TripRepository>(
    () => TripRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<SearchTripsUseCase>(
    () => SearchTripsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetTripDetailsUseCase>(
    () => GetTripDetailsUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<CreateTripUseCase>(
    () => CreateTripUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<UpdateTripUseCase>(
    () => UpdateTripUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<CancelTripUseCase>(
    () => CancelTripUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetMyTripsUseCase>(
    () => GetMyTripsUseCase(repository: getIt()),
  );
  getIt.registerFactory<TripsBloc>(
    () => TripsBloc(
      searchTripsUseCase: getIt(),
      getTripDetailsUseCase: getIt(),
      createTripUseCase: getIt(),
      updateTripUseCase: getIt(),
      cancelTripUseCase: getIt(),
      getMyTripsUseCase: getIt(),
    ),
  );

  // Cars Feature
  getIt.registerLazySingleton<CarRemoteDataSource>(
    () => CarRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<CarRepository>(
    () => CarRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton(() => GetMyCarsUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => AddCarUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => UpdateCarUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => DeleteCarUseCase(repository: getIt()));
  getIt.registerFactory(
    () => CarsBloc(
      getMyCarsUseCase: getIt(),
      addCarUseCase: getIt(),
      updateCarUseCase: getIt(),
      deleteCarUseCase: getIt(),
    ),
  );

  // Bookings Feature
  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(apiClient: getIt()),
  );
  getIt.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton(() => GetActiveBookingsUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetAllBookingsUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetBookingDetailsUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => CreateBookingUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetMyBookingsUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => CancelBookingUseCase(repository: getIt()));
  getIt.registerFactory(
    () => BookingsBloc(
      getActiveBookingsUseCase: getIt(),
      getAllBookingsUseCase: getIt(),
      getBookingDetailsUseCase: getIt(),
      createBookingUseCase: getIt(),
      getMyBookingsUseCase: getIt(),
      cancelBookingUseCase: getIt(),
    ),
  );
} 