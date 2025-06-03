import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/auth_result.dart';
import '../../domain/entities/user.dart';
import '../converters/user_converter.dart';

part 'auth_models.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.phoneNumber,
    required super.name,
    super.avatar,
    required super.isDriver,
    required super.createdAt,
    required super.updatedAt,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  
  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    phoneNumber: user.phoneNumber,
    name: user.name,
    avatar: user.avatar,
    isDriver: user.isDriver,
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
  );
}

@JsonSerializable()
class AuthResultModel extends AuthResult {
  @UserConverter()
  final User user;
  final String accessToken;
  final String refreshToken;

  const AuthResultModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  }) : super(
          user: user,
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

  factory AuthResultModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultModelToJson(this);
} 