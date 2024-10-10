class Message {
  final String id;
  final String chatroomId;
  final String personaId;
  final DateTime timestamp;
  final String content;

  Message({
    required this.id,
    required this.chatroomId,
    required this.personaId,
    required this.timestamp,
    required this.content,
  });

  @override
  String toString() {
    return 'Sender: $personaId\nChatroom: $chatroomId\nContent: $content\nTimestamp: $timestamp';
  }
}
