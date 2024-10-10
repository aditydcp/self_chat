import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String chatroomId;
  final String personaId;
  final DateTime timestamp;
  final String content;

  MessageModel({
    required this.id,
    required this.chatroomId,
    required this.personaId,
    required this.timestamp,
    required this.content,
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
