import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/trips_bloc.dart';
import '../widgets/trip_card.dart';

class MyTripsPage extends StatefulWidget {
  const MyTripsPage({super.key});

  @override
  State<MyTripsPage> createState() => _MyTripsPageState();
}

class _MyTripsPageState extends State<MyTripsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TripsBloc>().add(const GetMyTripsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/trips/create');
            },
          ),
        ],
      ),
      body: BlocBuilder<TripsBloc, TripsState>(
        builder: (context, state) {
          if (state is TripsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TripsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TripsBloc>().add(const GetMyTripsRequested());
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (state is TripsLoaded) {
            if (state.trips.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No trips found'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/trips/create');
                      },
                      child: const Text('Create Trip'),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<TripsBloc>().add(const GetMyTripsRequested());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.trips.length,
                itemBuilder: (context, index) {
                  final trip = state.trips[index];
                  return TripCard(
                    trip: trip,
                    showActions: true,
                    onEdit: () {
                      context.push('/trips/${trip.id}/edit');
                    },
                    onCancel: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Cancel Trip'),
                          content: const Text(
                            'Are you sure you want to cancel this trip? This action cannot be undone.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                context.read<TripsBloc>().add(
                                      CancelTripRequested(trip.id),
                                    );
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
} 