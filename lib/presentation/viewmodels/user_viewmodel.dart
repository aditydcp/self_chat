import 'package:flutter/material.dart';
import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/usecases/user/fetch_user.dart';
import 'package:self_chat/domain/usecases/user/add_user.dart';

class UserViewModel extends ChangeNotifier {
  final FetchUser fetchUser;
  final AddUser addUser;

  User? user;

  UserViewModel({required this.fetchUser, required this.addUser});

  Future<void> loadUser(String userId) async {
    user = await fetchUser(userId);
    notifyListeners();
  }

  Future<void> createUser(User user) async {
    await addUser(user);
  }
}
