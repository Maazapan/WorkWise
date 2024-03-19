import 'package:employments/models/categorie.dart';
import 'package:employments/models/companie.dart';
import 'package:employments/models/job.dart';
import 'package:employments/models/user.dart';

class Offer {
  final int id;
  final String title;
  final String description;
  final String image;
  final User user;
  final Job job;

  final Categorie categorie;
  final Companie companie;
  final String createdAt;

  const Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.user,
    required this.job,
    required this.categorie,
    required this.companie,
    required this.createdAt,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      createdAt: json['created_at'],
      user: User.fromJson(json['user']),
      job: Job.fromJson(json['job']),
      categorie: Categorie.fromJson(json['categorie']),
      companie: Companie.fromJson(json['companie']),
    );
  }
}
