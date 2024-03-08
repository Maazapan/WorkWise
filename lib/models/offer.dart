import 'package:employments/models/categorie.dart';
import 'package:employments/models/companie.dart';
import 'package:employments/models/job.dart';
import 'package:employments/models/user.dart';

class Offer {
  final int id;
  final User user;
  final Job job;
  final Categorie categorie;
  final Companie companie;

  const Offer({
    required this.id,
    required this.user,
    required this.job,
    required this.categorie,
    required this.companie,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      user: User.fromJson(json['user']),
      job: Job.fromJson(json['job']),
      categorie: Categorie.fromJson(json['categorie']),
      companie: Companie.fromJson(json['companie']),
    );
  }
}
