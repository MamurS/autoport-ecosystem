import '../../../../core/network/api_client.dart';
import '../models/booking_models.dart';

abstract class BookingRemoteDataSource {
  Future<List<BookingModel>> getActiveBookings();
  Future<List<BookingModel>> getAllBookings();
  Future<BookingModel> getBookingDetails(String bookingId);
  Future<BookingModel> createBooking(CreateBookingRequestModel request);
  Future<BookingListResponse> getMyBookings({required int page, int? limit});
  Future<void> cancelBooking(String bookingId);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final ApiClient apiClient;

  BookingRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<BookingModel>> getActiveBookings() async {
    final response = await apiClient.getActiveBookings();
    return (response as List)
        .map((json) => BookingModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<BookingModel>> getAllBookings() async {
    final response = await apiClient.getAllBookings();
    return (response as List)
        .map((json) => BookingModel.fromJson(json))
        .toList();
  }

  @override
  Future<BookingModel> getBookingDetails(String bookingId) async {
    final response = await apiClient.getBookingDetails(bookingId);
    return BookingModel.fromJson(response);
  }

  @override
  Future<BookingModel> createBooking(CreateBookingRequestModel request) async {
    final response = await apiClient.createBooking(request.tripId, request.seats);
    return BookingModel.fromJson(response);
  }

  @override
  Future<BookingListResponse> getMyBookings({required int page, int? limit}) async {
    final response = await apiClient.getMyBookings({
      'page': page,
      if (limit != null) 'limit': limit,
    });
    return BookingListResponse.fromJson(response);
  }

  @override
  Future<void> cancelBooking(String bookingId) async {
    await apiClient.cancelBooking(bookingId);
  }
} 