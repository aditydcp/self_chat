import 'package:self_chat/data/model/persona.dart';

class Message {
  final DateTime timestamp;
  final String message;
  final Persona sender;

  Message({
    required this.timestamp,
    required this.message,
    required this.sender,
  });
}
