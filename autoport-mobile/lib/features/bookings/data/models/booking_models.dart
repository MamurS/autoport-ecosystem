import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/booking.dart';

part 'booking_models.g.dart';

@JsonSerializable()
class BookingModel extends Booking {
  const BookingModel({
    required super.id,
    required super.tripId,
    required super.userId,
    required super.driverId,
    required super.driverName,
    super.driverAvatar,
    required super.from,
    required super.to,
    required super.departureTime,
    required super.seats,
    required super.price,
    required super.currency,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.isActive,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  Booking toEntity() => Booking(
    id: id,
    tripId: tripId,
    userId: userId,
    driverId: driverId,
    driverName: driverName,
    driverAvatar: driverAvatar,
    from: from,
    to: to,
    departureTime: departureTime,
    seats: seats,
    price: price,
    currency: currency,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isActive: isActive,
  );
}

@JsonSerializable()
class CreateBookingRequestModel {
  final String tripId;
  final int seats;
  final String? notes;

  const CreateBookingRequestModel({
    required this.tripId,
    required this.seats,
    this.notes,
  });

  factory CreateBookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookingRequestModelToJson(this);
}

@JsonSerializable()
class BookingListResponse {
  final List<BookingModel> bookings;
  final int page;
  final int total;

  const BookingListResponse({required this.bookings, required this.page, required this.total});

  factory BookingListResponse.fromJson(Map<String, dynamic> json) => _$BookingListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookingListResponseToJson(this);
} 