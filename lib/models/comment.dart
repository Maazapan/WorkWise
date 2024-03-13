import 'package:employments/models/user.dart';

class Comment {
  final int id;
  final User user;
  final int offerId;
  final String comment;

  const Comment({
    required this.id,
    required this.user,
    required this.offerId,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      offerId: json['offer_id'],
      comment: json['comment'],
      user: User.fromJson(json['user']),
    );
  }
}
