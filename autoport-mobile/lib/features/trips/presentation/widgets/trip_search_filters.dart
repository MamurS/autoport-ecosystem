import 'package:flutter/material.dart';

class TripSearchFilters extends StatefulWidget {
  final Function({
    String? sortBy,
    double? priceMin,
    double? priceMax,
    bool? verifiedOnly,
  }) onFiltersChanged;
  final String? initialSortBy;
  final double? initialPriceMin;
  final double? initialPriceMax;
  final bool initialVerifiedOnly;

  const TripSearchFilters({
    super.key,
    required this.onFiltersChanged,
    this.initialSortBy,
    this.initialPriceMin,
    this.initialPriceMax,
    this.initialVerifiedOnly = false,
  });

  @override
  State<TripSearchFilters> createState() => _TripSearchFiltersState();
}

class _TripSearchFiltersState extends State<TripSearchFilters> {
  late String? _sortBy;
  late double? _priceMin;
  late double? _priceMax;
  late bool _verifiedOnly;

  @override
  void initState() {
    super.initState();
    _sortBy = widget.initialSortBy;
    _priceMin = widget.initialPriceMin;
    _priceMax = widget.initialPriceMax;
    _verifiedOnly = widget.initialVerifiedOnly;
    _applyFilters();
  }

  void _applyFilters() {
    widget.onFiltersChanged(
      sortBy: _sortBy,
      priceMin: _priceMin,
      priceMax: _priceMax,
      verifiedOnly: _verifiedOnly,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _sortBy,
              decoration: const InputDecoration(
                labelText: 'Sort By',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'price_asc',
                  child: Text('Price: Low to High'),
                ),
                DropdownMenuItem(
                  value: 'price_desc',
                  child: Text('Price: High to Low'),
                ),
                DropdownMenuItem(
                  value: 'departure_asc',
                  child: Text('Departure: Soonest First'),
                ),
                DropdownMenuItem(
                  value: 'departure_desc',
                  child: Text('Departure: Latest First'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _sortBy = value;
                });
                _applyFilters();
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: _priceMin?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Min Price',
                      prefixText: '\$',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _priceMin = double.tryParse(value);
                      });
                      _applyFilters();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    initialValue: _priceMax?.toString(),
                    decoration: const InputDecoration(
                      labelText: 'Max Price',
                      prefixText: '\$',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _priceMax = double.tryParse(value);
                      });
                      _applyFilters();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Verified Drivers Only'),
              value: _verifiedOnly,
              onChanged: (value) {
                setState(() {
                  _verifiedOnly = value;
                });
                _applyFilters();
              },
            ),
          ],
        ),
      ),
    );
  }
} 