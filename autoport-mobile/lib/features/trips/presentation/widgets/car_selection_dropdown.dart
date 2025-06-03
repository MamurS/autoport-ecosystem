import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cars/domain/entities/car.dart';
import '../../../cars/presentation/bloc/cars_bloc.dart';

class CarSelectionDropdown extends StatelessWidget {
  final void Function(String)? onCarSelected;

  const CarSelectionDropdown({
    super.key,
    this.onCarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsBloc, CarsState>(
      builder: (context, state) {
        if (state is CarsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CarsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<CarsBloc>().add(const GetMyCarsRequested());
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (state is CarsLoaded) {
          if (state.cars.isEmpty) {
            return const Center(
              child: Text('No cars available. Please add a car first.'),
            );
          }

          return DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Car',
              border: OutlineInputBorder(),
            ),
            items: state.cars.map((car) {
              return DropdownMenuItem(
                value: car.id,
                child: Text('${car.make} ${car.model} (${car.licensePlate})'),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                onCarSelected?.call(value);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a car';
              }
              return null;
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
} 