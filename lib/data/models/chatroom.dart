import 'package:cloud_firestore/cloud_firestore.dart';

class Chatroom {
  final String id;
  final String name;

  Chatroom({required this.id, required this.name});

  factory Chatroom.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Chatroom(
      id: doc.id,
      name: data['name'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
    };
  }
}
