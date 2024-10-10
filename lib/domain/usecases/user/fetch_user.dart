import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/user_repository_interface.dart';

class FetchUser {
  final UserRepositoryInterface userRepository;

  FetchUser(this.userRepository);

  Future<User> call(String userId) async {
    return await userRepository.fetchUser(userId);
  }
}
