import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:self_chat/data/datasources/user/user_remote_data_source.dart';
import 'package:self_chat/data/models/user_model.dart';

class UserDataSourceFirestore extends UserRemoteDataSource {
  final FirebaseFirestore firestore;

  UserDataSourceFirestore(this.firestore);

  @override
  Future<void> addUser(UserModel user) async {
    await firestore.collection('users').doc(user.id).set(user.toJson());
  }

  @override
  Future<UserModel> fetchUser(String userId) async {
    DocumentSnapshot doc =
        await firestore.collection('users').doc(userId).get();
    return UserModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }
}
