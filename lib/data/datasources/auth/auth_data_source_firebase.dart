import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:self_chat/data/datasources/auth/auth_remote_data_source.dart';
import 'package:self_chat/data/models/user_model.dart';

class AuthDataSourceFirebase extends AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthDataSourceFirebase(this.firebaseAuth);

  @override
  Future<UserModel?> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // Map FirebaseAuth.User as UserModel
        return UserModel(
            id: user.uid,
            email: user.email!,
            username: user.displayName ?? user.email!);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return null;
  }

  @override
  Future<UserModel?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        // Map FirebaseAuth.User as UserModel
        return UserModel(
            id: user.uid,
            email: user.email!,
            username: user.displayName ?? user.email!);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
