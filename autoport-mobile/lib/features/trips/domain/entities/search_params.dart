import 'package:equatable/equatable.dart';

class SearchTripsParams {
  final String from;
  final String to;
  final DateTime date;
  final int seats;
  final int page;
  final String? sortBy;
  final double? priceMin;
  final double? priceMax;
  final bool? verifiedOnly;

  const SearchTripsParams({
    required this.from,
    required this.to,
    required this.date,
    required this.seats,
    required this.page,
    this.sortBy,
    this.priceMin,
    this.priceMax,
    this.verifiedOnly,
  });
}

class MyTripsParams {
  final int page;
  final int limit;
  final String? statusFilter;

  const MyTripsParams({
    required this.page,
    required this.limit,
    this.statusFilter,
  });
} 