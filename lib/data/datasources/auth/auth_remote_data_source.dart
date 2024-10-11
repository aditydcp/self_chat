import 'package:self_chat/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signUpUser(String email, String password);
  Future<UserModel?> signInUser(String email, String password);
  Future<void> signOut();
}
