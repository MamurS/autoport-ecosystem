import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bookings/presentation/bloc/bookings_bloc.dart';

class ActiveBookingsWidget extends StatelessWidget {
  const ActiveBookingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        if (state is BookingsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is BookingsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<BookingsBloc>().add(FetchActiveBookings());
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (state is BookingsLoaded) {
          final activeBookings = state.bookings.where((b) => b.isActive).toList();

          if (activeBookings.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No active bookings'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.push('/my-bookings'),
                    child: const Text('View All Bookings'),
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Active Bookings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/my-bookings'),
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activeBookings.length,
                itemBuilder: (context, index) {
                  final booking = activeBookings[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: booking.driverAvatar != null
                            ? NetworkImage(booking.driverAvatar!)
                            : null,
                        child: booking.driverAvatar == null
                            ? Text(booking.driverName[0])
                            : null,
                      ),
                      title: Text('${booking.from} → ${booking.to}'),
                      subtitle: Text(
                        '${booking.departureTime.hour}:${booking.departureTime.minute.toString().padLeft(2, '0')} - ${booking.status}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/bookings/${booking.id}'),
                    ),
                  );
                },
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
} 