class Persona {
  final String id;
  final String name;
  final String? avatar;
  final String userId;

  Persona(
      {required this.id, required this.name, this.avatar, this.userId = '1'});
}
