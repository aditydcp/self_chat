import 'package:self_chat/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.username});

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      email: json['email'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
    };
  }
}
