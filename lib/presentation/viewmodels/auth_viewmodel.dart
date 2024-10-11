import 'package:flutter/foundation.dart';
import 'package:self_chat/domain/usecases/auth/sign_in_user.dart';
import 'package:self_chat/domain/usecases/auth/sign_out_user.dart';
import 'package:self_chat/domain/usecases/auth/sign_up_user.dart';

class AuthViewmodel extends ChangeNotifier {
  final SignUpUser signUpUser;
  final SignInUser signInUser;
  final SignOutUser signOutUser;

  AuthViewmodel(
      {required this.signUpUser,
      required this.signInUser,
      required this.signOutUser});

  Future<void> signUp(String email, String password) async {
    if (kDebugMode) {
      print('Signing up with email: $email and password: $password');
    }
    await signUpUser(email, password);
  }

  Future<void> signIn(String email, String password) async {
    if (kDebugMode) {
      print('Signing in with email: $email and password: $password');
    }
    await signInUser(email, password);
  }

  Future<void> signOut() async {
    if (kDebugMode) {
      print('Signing out');
    }
    await signOutUser();
  }
}
