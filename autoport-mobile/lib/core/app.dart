import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'di/injection.dart'; // For getIt
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/trips/presentation/bloc/trips_bloc.dart'; // Assuming TripsBloc exists and is to be provided
import '../features/user/presentation/bloc/user_bloc.dart';   // Assuming UserBloc exists and is to be provided

class AutoPortApp extends StatelessWidget {
  const AutoPortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<UserBloc>()), // Ensure UserBloc is registered in injection.dart
        BlocProvider(create: (_) => getIt<TripsBloc>()), // Ensure TripsBloc is registered in injection.dart
        // Add other global BLoCs here (e.g., BookingsBloc, CarsBloc if needed globally)
      ],
      child: MaterialApp.router(
        title: 'AutoPort',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme, // Optional: if you have a dark theme defined
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
} 