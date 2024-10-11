import 'package:self_chat/data/datasources/auth/auth_remote_data_source.dart';
import 'package:self_chat/domain/entities/user.dart';
import 'package:self_chat/domain/repositories/auth_repository_interface.dart';

class AuthRepository extends AuthRepositoryInterface {
  final AuthRemoteDataSource dataSource;

  AuthRepository(this.dataSource);

  @override
  Future<User?> signUpUser(String email, String password) async {
    return await dataSource.signUpUser(email, password);
  }

  @override
  Future<User?> signInUser(String email, String password) async {
    return await dataSource.signInUser(email, password);
  }

  @override
  Future<void> signOut() async {
    await dataSource.signOut();
  }
}
