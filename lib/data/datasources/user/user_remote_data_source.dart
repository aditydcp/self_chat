import 'package:self_chat/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> fetchUser(String userId);
  Future<void> createUser(UserModel user);
}
