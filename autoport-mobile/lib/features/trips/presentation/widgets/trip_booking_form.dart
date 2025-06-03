import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/trip.dart';
import '../../../bookings/presentation/bloc/bookings_bloc.dart';
import '../../../bookings/data/models/booking_models.dart';

class TripBookingForm extends StatefulWidget {
  final Trip trip;

  const TripBookingForm({
    super.key,
    required this.trip,
  });

  @override
  State<TripBookingForm> createState() => _TripBookingFormState();
}

class _TripBookingFormState extends State<TripBookingForm> {
  final _formKey = GlobalKey<FormState>();
  final _seatsController = TextEditingController(text: '1');
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _seatsController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _bookTrip() {
    if (_formKey.currentState?.validate() ?? false) {
      final seats = int.parse(_seatsController.text);
      if (seats > widget.trip.availableSeats) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Not enough seats available'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      context.read<BookingsBloc>().add(
            CreateBookingRequested(
              CreateBookingRequestModel(
                tripId: widget.trip.id,
                seats: seats,
                notes: _notesController.text.isNotEmpty
                    ? _notesController.text
                    : null,
              ),
            ),
          );
      context.push('/bookings/confirmation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingsBloc, BookingsState>(
      listener: (context, state) {
        if (state is BookingsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Book Trip',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _seatsController,
              decoration: const InputDecoration(
                labelText: 'Number of Seats',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number of seats';
                }
                final seats = int.tryParse(value);
                if (seats == null || seats < 1) {
                  return 'Please enter a valid number of seats';
                }
                if (seats > widget.trip.availableSeats) {
                  return 'Not enough seats available';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes (Optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '\$${(widget.trip.pricePerSeat * int.parse(_seatsController.text)).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<BookingsBloc, BookingsState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is BookingsLoading ? null : _bookTrip,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: state is BookingsLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Book Now'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 