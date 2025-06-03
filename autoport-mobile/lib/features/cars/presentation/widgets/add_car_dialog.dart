import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/car_bloc.dart';
import '../../domain/entities/car.dart';
import '../../data/models/car_models.dart';

class AddCarDialog extends StatefulWidget {
  final Car? car;

  const AddCarDialog({super.key, this.car});

  @override
  State<AddCarDialog> createState() => _AddCarDialogState();
}

class _AddCarDialogState extends State<AddCarDialog> {
  final _formKey = GlobalKey<FormState>();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _colorController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _seatsController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.car != null) {
      _makeController.text = widget.car!.make;
      _modelController.text = widget.car!.model;
      _yearController.text = widget.car!.year.toString();
      _colorController.text = widget.car!.color;
      _licensePlateController.text = widget.car!.licensePlate;
      _seatsController.text = widget.car!.seats.toString();
      _notesController.text = widget.car!.notes ?? '';
    }
  }

  @override
  void dispose() {
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _colorController.dispose();
    _licensePlateController.dispose();
    _seatsController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final request = widget.car == null
          ? AddCarRequestModel(
              make: _makeController.text,
              model: _modelController.text,
              year: int.parse(_yearController.text),
              color: _colorController.text,
              licensePlate: _licensePlateController.text,
              seats: int.parse(_seatsController.text),
              notes: _notesController.text.isEmpty ? null : _notesController.text,
            )
          : UpdateCarRequestModel(
              make: _makeController.text,
              model: _modelController.text,
              year: int.parse(_yearController.text),
              color: _colorController.text,
              licensePlate: _licensePlateController.text,
              seats: int.parse(_seatsController.text),
              notes: _notesController.text.isEmpty ? null : _notesController.text,
            );

      if (widget.car == null) {
        context.read<CarBloc>().add(CarEvent.addCar(request as AddCarRequestModel));
      } else {
        context.read<CarBloc>().add(
              CarEvent.updateCar(
                widget.car!.id,
                request as UpdateCarRequestModel,
              ),
            );
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.car == null ? 'Add Car' : 'Edit Car'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _makeController,
                decoration: const InputDecoration(labelText: 'Make'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the make';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modelController,
                decoration: const InputDecoration(labelText: 'Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the model';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the year';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid year';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _colorController,
                decoration: const InputDecoration(labelText: 'Color'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the color';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _licensePlateController,
                decoration: const InputDecoration(labelText: 'License Plate'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the license plate';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _seatsController,
                decoration: const InputDecoration(labelText: 'Number of Seats'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of seats';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes (Optional)'),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text(widget.car == null ? 'Add' : 'Save'),
        ),
      ],
    );
  }
} 