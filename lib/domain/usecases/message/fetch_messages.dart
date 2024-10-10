import 'package:self_chat/domain/entities/message.dart';
import 'package:self_chat/domain/repositories/message_repository.dart';

class FetchMessages {
  final MessageRepositoryInterface repository;

  FetchMessages(this.repository);

  Stream<List<Message>> call(String chatroomId) {
    return repository.fetchMessages(chatroomId);
  }
}
