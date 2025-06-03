import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../cars/presentation/bloc/cars_bloc.dart';
import '../bloc/trips_bloc.dart';
import '../widgets/car_selection_dropdown.dart';

class EditTripPage extends StatefulWidget {
  final String tripId;

  const EditTripPage({
    super.key,
    required this.tripId,
  });

  @override
  State<EditTripPage> createState() => _EditTripPageState();
}

class _EditTripPageState extends State<EditTripPage> {
  final _formKey = GlobalKey<FormState>();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _seatsController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _departureDateTime;
  String? _selectedCarId;

  @override
  void initState() {
    super.initState();
    context.read<TripsBloc>().add(GetTripDetailsRequested(widget.tripId));
    context.read<CarsBloc>().add(const GetMyCarsRequested());
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _seatsController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _departureDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_departureDateTime ?? DateTime.now()),
      );

      if (time != null) {
        setState(() {
          _departureDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _updateTrip() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedCarId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a car'),
          ),
        );
        return;
      }

      if (_departureDateTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select departure time'),
          ),
        );
        return;
      }

      context.read<TripsBloc>().add(
            UpdateTripRequested(
              id: widget.tripId,
              carId: _selectedCarId!,
              fromCity: _fromController.text,
              toCity: _toController.text,
              departureTime: _departureDateTime!,
              availableSeats: int.parse(_seatsController.text),
              price: double.parse(_priceController.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Trip'),
      ),
      body: BlocConsumer<TripsBloc, TripsState>(
        listener: (context, state) {
          if (state is TripsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is TripsLoaded) {
            context.pop();
          }
        },
        builder: (context, state) {
          if (state is TripsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TripDetailsLoaded) {
            final trip = state.trip;
            if (_fromController.text.isEmpty) {
              _fromController.text = trip.fromLocation;
              _toController.text = trip.toLocation;
              _seatsController.text = trip.availableSeats.toString();
              _priceController.text = trip.pricePerSeat.toString();
              _departureDateTime = trip.departureDateTime;
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Trip Details',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _fromController,
                      decoration: const InputDecoration(
                        labelText: 'From',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter departure location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _toController,
                      decoration: const InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter destination location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: _selectDateTime,
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                        'Departure: ${_departureDateTime?.toString().split('.')[0] ?? 'Not set'}',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _seatsController,
                      decoration: const InputDecoration(
                        labelText: 'Available Seats',
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
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price per Seat',
                        prefixText: '\$',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price per seat';
                        }
                        final price = double.tryParse(value);
                        if (price == null || price <= 0) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CarSelectionDropdown(
                      onCarSelected: (carId) {
                        setState(() {
                          _selectedCarId = carId;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _updateTrip,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Update Trip'),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
} 