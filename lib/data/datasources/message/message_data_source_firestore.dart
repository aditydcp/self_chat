import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:self_chat/data/datasources/message/message_remote_data_source.dart';
import 'package:self_chat/data/models/message_model.dart';

class MessageDataSourceFirestore extends MessageRemoteDataSource {
  final FirebaseFirestore firestore;

  MessageDataSourceFirestore(this.firestore);

  @override
  Stream<List<MessageModel>> fetchMessages(String chatroomId) {
    return firestore
        .collection('messages')
        .where('chatroom_id', isEqualTo: chatroomId)
        .orderBy('timestamp')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromFirestore(doc))
            .toList());
  }

  @override
  Future<void> addMessage(MessageModel message) async {
    await firestore.collection('messages').add(message.toFirestore());
  }
}
