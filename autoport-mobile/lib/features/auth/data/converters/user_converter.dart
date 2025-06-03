import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';
import '../models/auth_models.dart';

class UserConverter implements JsonConverter<User, Map<String, dynamic>> {
  const UserConverter();

  @override
  User fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(User user) => (user as UserModel).toJson();
} 