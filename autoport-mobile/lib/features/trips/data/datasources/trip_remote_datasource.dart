import '../../../../core/network/api_client.dart';
import '../models/trip_models.dart';
import '../../domain/entities/search_params.dart';

abstract class TripRemoteDataSource {
  Future<TripSearchResponse> searchTrips(SearchTripsParams params);
  Future<TripResponse> getTripDetails(String tripId);
  Future<TripResponse> createTrip(CreateTripRequest request);
  Future<TripResponse> updateTrip(String tripId, UpdateTripRequest request);
  Future<void> cancelTrip(String tripId);
  Future<TripSearchResponse> getMyTrips(MyTripsParams params);
}

class TripRemoteDataSourceImpl implements TripRemoteDataSource {
  final ApiClient apiClient;
  
  const TripRemoteDataSourceImpl({required this.apiClient});
  
  @override
  Future<TripSearchResponse> searchTrips(SearchTripsParams params) async {
    final response = await apiClient.get(
      '/trips/search',
      queryParameters: {
        'from': params.from,
        'to': params.to,
        'date': params.date.toIso8601String(),
        'seats': params.seats,
        'page': params.page,
        if (params.sortBy != null) 'sort_by': params.sortBy,
        if (params.priceMin != null) 'price_min': params.priceMin,
        if (params.priceMax != null) 'price_max': params.priceMax,
        if (params.verifiedOnly != null) 'verified_only': params.verifiedOnly,
      },
    );
    return TripSearchResponse.fromJson(response.data);
  }
  
  @override
  Future<TripResponse> getTripDetails(String tripId) async {
    final response = await apiClient.get('/trips/$tripId');
    return TripResponse.fromJson(response.data);
  }
  
  @override
  Future<TripResponse> createTrip(CreateTripRequest request) async {
    final response = await apiClient.post(
      '/trips',
      data: request.toJson(),
    );
    return TripResponse.fromJson(response.data);
  }
  
  @override
  Future<TripResponse> updateTrip(String tripId, UpdateTripRequest request) async {
    final response = await apiClient.put(
      '/trips/$tripId',
      data: request.toJson(),
    );
    return TripResponse.fromJson(response.data);
  }
  
  @override
  Future<void> cancelTrip(String tripId) async {
    await apiClient.delete('/trips/$tripId');
  }
  
  @override
  Future<TripSearchResponse> getMyTrips(MyTripsParams params) async {
    final response = await apiClient.get(
      '/trips/my',
      queryParameters: {
        'page': params.page,
        'limit': params.limit,
        if (params.statusFilter != null) 'status': params.statusFilter,
      },
    );
    return TripSearchResponse.fromJson(response.data);
  }
} 