import 'package:self_chat/domain/entities/user.dart';

abstract class AuthRepositoryInterface {
  Future<User?> signUpUser(String email, String password);
  Future<User?> signInUser(String email, String password);
  Future<void> signOut();
}
