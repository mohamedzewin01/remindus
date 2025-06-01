import 'package:remindus/features/Auth/domain/entities/user_entity.dart';

class UserLoginModel {
  final String id;
  final String email;
  final String name;

  UserLoginModel({required this.id, required this.email, required this.name});

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }

}
