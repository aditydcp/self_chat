import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/auth_repository_interface.dart';

class SignInUser {
  final AuthRepositoryInterface authRepository;

  SignInUser(this.authRepository);

  Future<User?> call(String email, String password) async {
    return await authRepository.signInUser(email, password);
  }
}
