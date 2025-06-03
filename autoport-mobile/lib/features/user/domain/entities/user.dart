import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final String? avatar;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.avatar,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    phoneNumber,
    avatar,
    isVerified,
    createdAt,
    updatedAt,
  ];
} 