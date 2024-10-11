import 'package:self_chat/domain/repositories/auth_repository_interface.dart';

class SignOutUser {
  final AuthRepositoryInterface authRepository;

  SignOutUser(this.authRepository);

  Future<void> call() async {
    await authRepository.signOut();
  }
}
