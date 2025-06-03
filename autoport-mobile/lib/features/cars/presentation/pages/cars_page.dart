import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/car_bloc.dart';
import '../widgets/car_list_item.dart';
import '../widgets/add_car_dialog.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cars'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddCarDialog(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state.status == CarStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == CarStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage ?? 'An error occurred',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CarBloc>().add(const CarEvent.getMyCars());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state.cars.isEmpty) {
            return const Center(
              child: Text('No cars added yet'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.cars.length,
            itemBuilder: (context, index) {
              final car = state.cars[index];
              return CarListItem(
                car: car,
                onEdit: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddCarDialog(car: car),
                  );
                },
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Car'),
                      content: const Text(
                        'Are you sure you want to delete this car?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<CarBloc>()
                                .add(CarEvent.deleteCar(car.id));
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
} 