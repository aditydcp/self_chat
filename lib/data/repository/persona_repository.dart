import 'package:self_chat/data/model/persona.dart';

class PersonaRepository {
  List<Persona> personas = [
    const Persona(id: '1', name: 'Jacob'),
    const Persona(id: '2', name: 'Michael'),
  ];

  List<Persona> getPersonas() {
    return personas;
  }
}
