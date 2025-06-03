import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String phoneNumber;
  final String name;
  final String? avatar;
  final bool isDriver;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    this.avatar,
    required this.isDriver,
    required this.createdAt,
    required this.updatedAt,
  });
  
  @override
  List<Object?> get props => [
    id,
    phoneNumber,
    name,
    avatar,
    isDriver,
    createdAt,
    updatedAt,
  ];
} 