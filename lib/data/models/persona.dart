import 'package:cloud_firestore/cloud_firestore.dart';

class Persona {
  final String id;
  final String name;
  final String? avatar;
  final String userId;

  Persona(
      {required this.id, required this.name, this.avatar, this.userId = '1'});

  factory Persona.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Persona(
      id: doc.id,
      name: data['name'] ?? '',
      avatar: data['avatar'] ?? '',
      userId: data['user_id'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'avatar': avatar,
      'user_id': userId,
    };
  }
}
