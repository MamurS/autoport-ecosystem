import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/cars/presentation/pages/cars_page.dart';
// Import other pages as needed

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/cars',
        builder: (context, state) => const CarsPage(),
      ),
      // Add other routes here
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: \\${state.uri.toString()}'),
      ),
    ),
  );
} 