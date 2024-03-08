class Companie {
  final int id;
  final String name;
  final String phone;
  final String direction;

  const Companie(
      {required this.id,
      required this.name,
      required this.phone,
      required this.direction});

  factory Companie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": int id,
        "name": String name,
        "phone": String phone,
        "direction": String direction,
      } =>
        Companie(
          id: id,
          name: name,
          phone: phone,
          direction: direction,
        ),
      _ => throw const FormatException("Fallo al cargar el modelo"),
    };
  }
}
