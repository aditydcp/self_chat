import 'package:self_chat/domain/entities/user.dart';

abstract class UserRepositoryInterface {
  Future<void> addUser(User user);
  Future<User> fetchUser(String userId);
}
