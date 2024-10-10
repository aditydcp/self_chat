import 'package:self_chat/data/models/message_model.dart';

abstract class MessageRemoteDataSource {
  Stream<List<MessageModel>> fetchMessages(String chatroomId);
  Future<void> addMessage(MessageModel message);
}
