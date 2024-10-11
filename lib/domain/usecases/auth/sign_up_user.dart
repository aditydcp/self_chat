import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/auth_repository_interface.dart';

class SignUpUser {
  final AuthRepositoryInterface authRepository;

  SignUpUser(this.authRepository);

  Future<User?> call(String email, String password) async {
    return await authRepository.signUpUser(email, password);
  }
}
