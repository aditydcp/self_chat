import 'package:self_chat/domain/entities/message.dart';
import 'package:self_chat/domain/repositories/message_repository.dart';

class AddMessage {
  final MessageRepositoryInterface repository;

  AddMessage(this.repository);

  Future<void> call(Message message) {
    return repository.sendMessage(message);
  }
}
