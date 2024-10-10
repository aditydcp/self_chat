import 'package:self_chat/domain/entities/message.dart';

abstract class MessageRepository {
  Stream<List<Message>> fetchMessages(String chatroomId);
  Future<void> sendMessage(Message message);
}
