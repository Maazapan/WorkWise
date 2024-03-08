class Categorie {
  final int id;
  final String name;

  const Categorie({required this.id, required this.name});

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": int id,
        "name": String name,
      } =>
        Categorie(
          id: id,
          name: name,
        ),
      _ => throw const FormatException("Fallo al cargar el modelo"),
    };
  }
}
