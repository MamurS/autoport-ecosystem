import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/trip.dart';
import '../../domain/entities/search_result_entity.dart';
import '../../domain/entities/trip_request.dart';

part 'trip_models.g.dart';

@JsonSerializable()
class TripModel extends Trip {
  const TripModel({
    required super.id,
    required super.driverId,
    required super.driverName,
    super.driverRating,
    required super.fromLocation,
    required super.toLocation,
    required super.departureDateTime,
    required super.totalSeats,
    required super.availableSeats,
    required super.pricePerSeat,
    super.carMake,
    super.carModel,
    super.carColor,
    super.carLicensePlate,
    required super.isVerified,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => _$TripModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripModelToJson(this);

  factory TripModel.fromEntity(Trip trip) => TripModel(
    id: trip.id,
    driverId: trip.driverId,
    driverName: trip.driverName,
    driverRating: trip.driverRating,
    fromLocation: trip.fromLocation,
    toLocation: trip.toLocation,
    departureDateTime: trip.departureDateTime,
    totalSeats: trip.totalSeats,
    availableSeats: trip.availableSeats,
    pricePerSeat: trip.pricePerSeat,
    carMake: trip.carMake,
    carModel: trip.carModel,
    carColor: trip.carColor,
    carLicensePlate: trip.carLicensePlate,
    isVerified: trip.isVerified,
    createdAt: trip.createdAt,
    updatedAt: trip.updatedAt,
  );
}

@JsonSerializable()
class TripSearchResponse {
  final List<TripModel> trips;
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  const TripSearchResponse({
    required this.trips,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory TripSearchResponse.fromJson(Map<String, dynamic> json) => _$TripSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TripSearchResponseToJson(this);

  SearchResultEntity toEntity() => SearchResultEntity(
    trips: trips,
    total: total,
    page: page,
    hasMorePages: page < totalPages,
  );
}

@JsonSerializable()
class TripResponse {
  final TripModel trip;

  const TripResponse({required this.trip});

  factory TripResponse.fromJson(Map<String, dynamic> json) => _$TripResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TripResponseToJson(this);
}

@JsonSerializable()
class CreateTripRequest {
  final String fromLocation;
  final String toLocation;
  final DateTime departureDateTime;
  final int totalSeats;
  final double pricePerSeat;
  final String? carMake;
  final String? carModel;
  final String? carColor;
  final String? carLicensePlate;

  const CreateTripRequest({
    required this.fromLocation,
    required this.toLocation,
    required this.departureDateTime,
    required this.totalSeats,
    required this.pricePerSeat,
    this.carMake,
    this.carModel,
    this.carColor,
    this.carLicensePlate,
  });

  factory CreateTripRequest.fromJson(Map<String, dynamic> json) => _$CreateTripRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateTripRequestToJson(this);
}

@JsonSerializable()
class UpdateTripRequest {
  final String? fromLocation;
  final String? toLocation;
  final DateTime? departureDateTime;
  final int? totalSeats;
  final double? pricePerSeat;
  final String? carMake;
  final String? carModel;
  final String? carColor;
  final String? carLicensePlate;

  const UpdateTripRequest({
    this.fromLocation,
    this.toLocation,
    this.departureDateTime,
    this.totalSeats,
    this.pricePerSeat,
    this.carMake,
    this.carModel,
    this.carColor,
    this.carLicensePlate,
  });

  factory UpdateTripRequest.fromJson(Map<String, dynamic> json) => _$UpdateTripRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateTripRequestToJson(this);
} 