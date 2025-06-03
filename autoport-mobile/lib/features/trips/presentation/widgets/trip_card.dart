import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  final bool showActions;
  final VoidCallback? onEdit;
  final VoidCallback? onCancel;

  const TripCard({
    super.key,
    required this.trip,
    this.showActions = false,
    this.onEdit,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('h:mm a');

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => context.push('/trips/${trip.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(trip.driverName[0].toUpperCase()),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trip.driverName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (trip.driverRating != null)
                          Row(
                            children: [
                              const Icon(Icons.star, size: 16, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(
                                trip.driverRating!.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${trip.pricePerSeat.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trip.fromLocation),
                        const SizedBox(height: 4),
                        Text(trip.toLocation),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(timeFormat.format(trip.departureDateTime)),
                  const SizedBox(width: 16),
                  const Icon(Icons.event_seat, color: Colors.green),
                  const SizedBox(width: 8),
                  Text('${trip.availableSeats} seats available'),
                ],
              ),
              if (trip.carMake != null && trip.carModel != null) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.directions_car, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('${trip.carMake} ${trip.carModel}'),
                    if (trip.carColor != null) ...[
                      const SizedBox(width: 8),
                      Text('(${trip.carColor})'),
                    ],
                    if (trip.carLicensePlate != null) ...[
                      const SizedBox(width: 16),
                      Text(trip.carLicensePlate!),
                    ],
                  ],
                ),
              ],
              if (showActions && (onEdit != null || onCancel != null)) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (onEdit != null)
                      TextButton.icon(
                        onPressed: onEdit,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                    if (onCancel != null) ...[
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: onCancel,
                        icon: const Icon(Icons.cancel),
                        label: const Text('Cancel'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 