class Job {
  final int id;
  final String salary;
  final String description;
  final String address;

  final String requirements;
  final String date;

  const Job(
      {required this.id,
      required this.salary,
      required this.description,
      required this.address,
      required this.requirements,
      required this.date});

  factory Job.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": int id,
        "salary": String salary,
        "description": String description,
        "address": String address,
        "requirements": String requirements,
        "date": String date,
      } =>
        Job(
          id: id,
          salary: salary,
          description: description,
          address: address,
          requirements: requirements,
          date: date,
        ),
      _ => throw const FormatException("Fallo al cargar el modelo"),
    };
  }
}
