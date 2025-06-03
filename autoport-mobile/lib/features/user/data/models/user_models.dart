import 'package:json_annotation/json_annotation.dart';
import '../../../auth/data/models/auth_models.dart';
import '../../../auth/data/converters/user_converter.dart';

part 'user_models.g.dart';

@JsonSerializable()
class UserResponse {
  @UserConverter()
  final UserModel user;

  const UserResponse({required this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UpdateProfileRequestModel {
  final String name;

  const UpdateProfileRequestModel({required this.name});

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProfileRequestModelToJson(this);
} 