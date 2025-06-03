import 'package:equatable/equatable.dart';
import 'trip.dart';

class SearchResultEntity extends Equatable {
  final List<Trip> trips;
  final int total;
  final int page;
  final bool hasMorePages;

  const SearchResultEntity({
    required this.trips,
    required this.total,
    required this.page,
    required this.hasMorePages,
  });

  @override
  List<Object?> get props => [trips, total, page, hasMorePages];
} 