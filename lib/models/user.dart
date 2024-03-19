class User {
  final int id;
  final String name;
  final String email;
  final String bio;
  final String profilePhoto;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.profilePhoto,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      profilePhoto: json['profile_photo'] as String,
    );
  }
}
