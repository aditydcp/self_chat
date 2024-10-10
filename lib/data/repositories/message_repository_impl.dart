import 'package:self_chat/data/datasources/message/message_remote_data_source.dart';
import 'package:self_chat/domain/entities/message.dart';
import 'package:self_chat/domain/repositories/message_repository.dart';
import 'package:self_chat/data/models/message_model.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource dataSource;

  MessageRepositoryImpl(this.dataSource);

  @override
  Stream<List<Message>> fetchMessages(String chatroomId) {
    return dataSource.fetchMessages(chatroomId).map((models) => models
        .map((model) => Message(
              id: model.id,
              chatroomId: model.chatroomId,
              personaId: model.personaId,
              timestamp: model.timestamp,
              content: model.content,
            ))
        .toList());
  }

  @override
  Future<void> sendMessage(Message message) async {
    final messageModel = MessageModel(
      id: message.id,
      chatroomId: message.chatroomId,
      personaId: message.personaId,
      timestamp: message.timestamp,
      content: message.content,
    );
    await dataSource.addMessage(messageModel);
  }
}
