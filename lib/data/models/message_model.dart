import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:self_chat/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    required super.id,
    required super.chatroomId,
    required super.personaId,
    required super.timestamp,
    required super.content,
  });

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      id: doc.id,
      chatroomId: data['chatroom_id'],
      personaId: data['persona_id'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      content: data['content'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'chatroom_id': chatroomId,
      'persona_id': personaId,
      'timestamp': Timestamp.fromDate(timestamp),
      'content': content,
    };
  }
}
