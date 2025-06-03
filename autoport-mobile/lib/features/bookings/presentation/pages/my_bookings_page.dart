import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../bloc/bookings_bloc.dart';
import '../../domain/entities/booking.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  int _currentPage = 1;
  static const int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  void _fetchBookings() {
    context.read<BookingsBloc>().add(
          MyBookingsFetched(
            page: _currentPage,
            limit: _pageSize,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
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
                    onPressed: _fetchBookings,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is MyBookingsLoaded) {
            if (state.bookings.isEmpty) {
              return const Center(
                child: Text('No bookings found'),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  _currentPage = 1;
                });
                _fetchBookings();
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.bookings.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.bookings.length) {
                    if (state.bookings.length < state.total) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentPage++;
                              });
                              _fetchBookings();
                            },
                            child: const Text('Load More'),
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }

                  final booking = state.bookings[index];
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
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${dateFormat.format(booking.departureTime)} at ${timeFormat.format(booking.departureTime)}',
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(booking.status),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              booking.status.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${booking.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${booking.seats} seat${booking.seats > 1 ? 's' : ''}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      case 'completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
} 