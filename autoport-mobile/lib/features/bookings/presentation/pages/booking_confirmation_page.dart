import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../bloc/bookings_bloc.dart';

class BookingConfirmationPage extends StatelessWidget {
  const BookingConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
      ),
      body: BlocBuilder<BookingsBloc, BookingsState>(
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
                      context.pop();
                    },
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            );
          }

          if (state is BookingSuccess) {
            final booking = state.booking;
            final dateFormat = DateFormat('EEEE, MMMM d, y');
            final timeFormat = DateFormat('h:mm a');

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 64,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Booking Confirmed!',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Details',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(
                            context,
                            'Booking ID',
                            booking.id,
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            context,
                            'From',
                            booking.from,
                          ),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                            context,
                            'To',
                            booking.to,
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            context,
                            'Departure',
                            '${dateFormat.format(booking.departureTime)} at ${timeFormat.format(booking.departureTime)}',
                          ),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                            context,
                            'Seats',
                            '${booking.seats} seat${booking.seats > 1 ? 's' : ''}',
                          ),
                          const Divider(height: 24),
                          _buildInfoRow(
                            context,
                            'Total Price',
                            '\$${booking.price.toStringAsFixed(2)}',
                          ),
                          const SizedBox(height: 8),
                          _buildInfoRow(
                            context,
                            'Status',
                            booking.status.toUpperCase(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/bookings/${booking.id}');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('View Booking Details'),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      context.push('/');
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Go to Home'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
} 