import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/trip.dart';

class TripDetailsCard extends StatelessWidget {
  final Trip trip;

  const TripDetailsCard({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM d, y');
    final timeFormat = DateFormat('h:mm a');

    return Card(
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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (trip.driverRating != null)
                        Row(
                          children: [
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              trip.driverRating!.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (trip.isVerified)
                  const Icon(Icons.verified, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.fromLocation,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        dateFormat.format(trip.departureDateTime),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        timeFormat.format(trip.departureDateTime),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        trip.toLocation,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        '${trip.availableSeats} seats available',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        '\$${trip.pricePerSeat.toStringAsFixed(2)} per seat',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (trip.carMake != null && trip.carModel != null) ...[
              const SizedBox(height: 16),
              const Divider(),
              Row(
                children: [
                  const Icon(Icons.directions_car),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${trip.carMake} ${trip.carModel}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        if (trip.carColor != null)
                          Text(
                            trip.carColor!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        if (trip.carLicensePlate != null)
                          Text(
                            trip.carLicensePlate!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
} 