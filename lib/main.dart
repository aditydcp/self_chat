import 'package:flutter/material.dart';
import 'package:self_chat/data/model/chatroom.dart';
import 'package:self_chat/data/model/persona.dart';
import 'package:self_chat/data/repository/chatroom_repository.dart';
import 'package:self_chat/data/repository/persona_repository.dart';
import 'package:self_chat/presentation/pages/chatroom.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late PersonaRepository personaRepository;
  late ChatroomRepository chatroomRepository;
  late Persona activePersona;

  @override
  void initState() {
    super.initState();

    // Initialize the repositories.
    personaRepository = PersonaRepository(personas: [
      const Persona(id: '1', name: "Jacob"),
      const Persona(id: '2', name: "Michael"),
    ]);

    activePersona = personaRepository.getPersonas()[0];

    chatroomRepository = ChatroomRepository(chatrooms: [
      Chatroom(
          id: '1',
          name: personaRepository.getPersonas()[1].name,
          members: [
            personaRepository.getPersonas()[0],
            personaRepository.getPersonas()[1]
          ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatroomScreen(
          chatroom: chatroomRepository.getChatrooms()[0],
          activePersona: activePersona),
    );
  }
}
