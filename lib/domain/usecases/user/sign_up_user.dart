import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/user_repository_interface.dart';

class SignUpUser {
  final UserRepositoryInterface userRepository;

  SignUpUser(this.userRepository);

  Future<void> call(User user) async {
    await userRepository.createUser(user);
  }
}
