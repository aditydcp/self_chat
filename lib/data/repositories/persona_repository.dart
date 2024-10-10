import 'package:self_chat/data/models/persona.dart';

class PersonaRepository {
  final List<Persona> personas;

  PersonaRepository({required this.personas});

  List<Persona> getPersonas() {
    return personas;
  }
}
