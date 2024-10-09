import 'package:self_chat/data/model/chatroom.dart';

class ChatroomRepository {
  final List<Chatroom> chatrooms;

  const ChatroomRepository({required this.chatrooms});

  List<Chatroom> getChatrooms() {
    return chatrooms;
  }
}
