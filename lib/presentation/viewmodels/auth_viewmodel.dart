import 'package:flutter/material.dart';
import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/usecases/user/fetch_user.dart';
import 'package:self_chat/domain/usecases/user/sign_up_user.dart';

class UserViewModel extends ChangeNotifier {
  final FetchUser fetchUser;
  final SignUpUser signUpUser;

  User? user;

  UserViewModel({required this.fetchUser, required this.signUpUser});

  Future<void> loadUser(String userId) async {
    user = await fetchUser(userId);
    notifyListeners();
  }

  Future<void> signUp(User user) async {
    await signUpUser(user);
  }
}
