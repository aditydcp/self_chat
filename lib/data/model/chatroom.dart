import 'package:self_chat/data/model/persona.dart';

class Chatroom {
  final String id;
  final String name;
  final List<Persona> members;

  Chatroom({required this.id, required this.name, required this.members});
}
