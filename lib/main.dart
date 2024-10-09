import 'package:flutter/material.dart';
import 'package:self_chat/data/model/persona.dart';
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
  final PersonaRepository personaRepository = PersonaRepository();
  late Persona activePersona;

  @override
  void initState() {
    super.initState();
    // Initialize activePersona after the state has been initialized
    activePersona = personaRepository.getPersonas()[0];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatroomScreen(roomName: "Chat Room", activePersona: activePersona),
    );
  }
}
