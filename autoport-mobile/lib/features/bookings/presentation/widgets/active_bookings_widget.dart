import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../bloc/bookings_bloc.dart';
import '../../domain/entities/booking.dart';

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
                Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<BookingsBloc>().add(const FetchActiveBookings());
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is ActiveBookingsLoaded) {
          final activeBookings = state.bookings.where((b) => b.isActive).toList();

          if (activeBookings.isEmpty) {
            return const Center(
              child: Text('No active bookings'),
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
                      onPressed: () {
                        context.push('/bookings');
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: activeBookings.length > 3 ? 3 : activeBookings.length,
                itemBuilder: (context, index) {
                  final booking = activeBookings[index];
                  final dateFormat = DateFormat('MMM d, y');
                  final timeFormat = DateFormat('h:mm a');

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      onTap: () {
                        context.push('/bookings/${booking.id}');
                      },
                      leading: CircleAvatar(
                        child: Text(booking.driverName[0].toUpperCase()),
                      ),
                      title: Text(
                        '${booking.from} → ${booking.to}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${dateFormat.format(booking.departureTime)} at ${timeFormat.format(booking.departureTime)}',
                      ),
                      trailing: Text(
                        '${booking.seats} seat${booking.seats > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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