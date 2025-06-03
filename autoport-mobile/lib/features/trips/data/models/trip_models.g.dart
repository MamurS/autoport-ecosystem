// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel(
      id: json['id'] as String,
      driverId: json['driverId'] as String,
      driverName: json['driverName'] as String,
      driverRating: (json['driverRating'] as num?)?.toDouble(),
      fromLocation: json['fromLocation'] as String,
      toLocation: json['toLocation'] as String,
      departureDateTime: DateTime.parse(json['departureDateTime'] as String),
      totalSeats: (json['totalSeats'] as num).toInt(),
      availableSeats: (json['availableSeats'] as num).toInt(),
      pricePerSeat: (json['pricePerSeat'] as num).toDouble(),
      carMake: json['carMake'] as String?,
      carModel: json['carModel'] as String?,
      carColor: json['carColor'] as String?,
      carLicensePlate: json['carLicensePlate'] as String?,
      isVerified: json['isVerified'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverRating': instance.driverRating,
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'departureDateTime': instance.departureDateTime.toIso8601String(),
      'totalSeats': instance.totalSeats,
      'availableSeats': instance.availableSeats,
      'pricePerSeat': instance.pricePerSeat,
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'carColor': instance.carColor,
      'carLicensePlate': instance.carLicensePlate,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

TripSearchResponse _$TripSearchResponseFromJson(Map<String, dynamic> json) =>
    TripSearchResponse(
      trips: (json['trips'] as List<dynamic>)
          .map((e) => TripModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$TripSearchResponseToJson(TripSearchResponse instance) =>
    <String, dynamic>{
      'trips': instance.trips,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

TripResponse _$TripResponseFromJson(Map<String, dynamic> json) => TripResponse(
      trip: TripModel.fromJson(json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TripResponseToJson(TripResponse instance) =>
    <String, dynamic>{
      'trip': instance.trip,
    };

CreateTripRequest _$CreateTripRequestFromJson(Map<String, dynamic> json) =>
    CreateTripRequest(
      fromLocation: json['fromLocation'] as String,
      toLocation: json['toLocation'] as String,
      departureDateTime: DateTime.parse(json['departureDateTime'] as String),
      totalSeats: (json['totalSeats'] as num).toInt(),
      pricePerSeat: (json['pricePerSeat'] as num).toDouble(),
      carMake: json['carMake'] as String?,
      carModel: json['carModel'] as String?,
      carColor: json['carColor'] as String?,
      carLicensePlate: json['carLicensePlate'] as String?,
    );

Map<String, dynamic> _$CreateTripRequestToJson(CreateTripRequest instance) =>
    <String, dynamic>{
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'departureDateTime': instance.departureDateTime.toIso8601String(),
      'totalSeats': instance.totalSeats,
      'pricePerSeat': instance.pricePerSeat,
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'carColor': instance.carColor,
      'carLicensePlate': instance.carLicensePlate,
    };

UpdateTripRequest _$UpdateTripRequestFromJson(Map<String, dynamic> json) =>
    UpdateTripRequest(
      fromLocation: json['fromLocation'] as String?,
      toLocation: json['toLocation'] as String?,
      departureDateTime: json['departureDateTime'] == null
          ? null
          : DateTime.parse(json['departureDateTime'] as String),
      totalSeats: (json['totalSeats'] as num?)?.toInt(),
      pricePerSeat: (json['pricePerSeat'] as num?)?.toDouble(),
      carMake: json['carMake'] as String?,
      carModel: json['carModel'] as String?,
      carColor: json['carColor'] as String?,
      carLicensePlate: json['carLicensePlate'] as String?,
    );

Map<String, dynamic> _$UpdateTripRequestToJson(UpdateTripRequest instance) =>
    <String, dynamic>{
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'departureDateTime': instance.departureDateTime?.toIso8601String(),
      'totalSeats': instance.totalSeats,
      'pricePerSeat': instance.pricePerSeat,
      'carMake': instance.carMake,
      'carModel': instance.carModel,
      'carColor': instance.carColor,
      'carLicensePlate': instance.carLicensePlate,
    };
