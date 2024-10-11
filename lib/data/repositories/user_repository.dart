import 'package:self_chat/data/datasources/user/user_remote_data_source.dart';
import 'package:self_chat/data/models/user_model.dart';
import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/user_repository_interface.dart';

class UserRepository implements UserRepositoryInterface {
  final UserRemoteDataSource dataSource;

  UserRepository(this.dataSource);

  @override
  Future<void> addUser(User user) async {
    final userModel =
        UserModel(id: user.id, email: user.email, username: user.username);
    await dataSource.addUser(userModel);
  }

  @override
  Future<User> fetchUser(String userId) async {
    return await dataSource.fetchUser(userId);
  }
}
