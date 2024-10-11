import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/user_repository_interface.dart';

class AddUser {
  final UserRepositoryInterface userRepository;

  AddUser(this.userRepository);

  Future<void> call(User user) async {
    await userRepository.addUser(user);
  }
}
