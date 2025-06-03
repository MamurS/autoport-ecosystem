import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/trips_bloc.dart';
import '../widgets/trip_results_list.dart';
import '../widgets/trip_search_filters.dart';

class TripSearchPage extends StatefulWidget {
  final String fromCity;
  final String toCity;
  final DateTime date;

  const TripSearchPage({
    super.key,
    required this.fromCity,
    required this.toCity,
    required this.date,
  });

  @override
  State<TripSearchPage> createState() => _TripSearchPageState();
}

class _TripSearchPageState extends State<TripSearchPage> {
  bool _showFilters = false;
  String? _sortBy;
  double? _priceMin;
  double? _priceMax;
  bool? _verifiedOnly;

  @override
  void initState() {
    super.initState();
    _searchTrips();
  }

  void _searchTrips() {
    context.read<TripsBloc>().add(
          SearchTripsRequested(
            fromCity: widget.fromCity,
            toCity: widget.toCity,
            date: widget.date,
          ),
        );
  }

  void _onFiltersChanged({
    String? sortBy,
    double? priceMin,
    double? priceMax,
    bool? verifiedOnly,
  }) {
    setState(() {
      _sortBy = sortBy;
      _priceMin = priceMin;
      _priceMax = priceMax;
      _verifiedOnly = verifiedOnly;
    });
    _searchTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.fromCity} → ${widget.toCity}'),
        actions: [
          IconButton(
            icon: Icon(_showFilters ? Icons.filter_list_off : Icons.filter_list),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_showFilters)
            TripSearchFilters(
              onFiltersChanged: _onFiltersChanged,
              initialSortBy: _sortBy,
              initialPriceMin: _priceMin,
              initialPriceMax: _priceMax,
              initialVerifiedOnly: _verifiedOnly ?? false,
            ),
          Expanded(
            child: BlocBuilder<TripsBloc, TripsState>(
              builder: (context, state) {
                if (state is TripsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TripsError) {
                  return TripResultsList(
                    trips: const [],
                    error: state.message,
                    onRetry: _searchTrips,
                  );
                }

                if (state is TripsLoaded) {
                  return TripResultsList(
                    trips: state.trips,
                    onRetry: _searchTrips,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
} 