class User {
  final int id;
  final String name;
  final String email;
  final String bio;
  final String profilePhoto;
  final List<int> offersSaved;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.profilePhoto,
    required this.offersSaved,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    String offersSavedString = json['offers_saved'];

    List<String> offersSavedList =
        offersSavedString.replaceAll("[", "").replaceAll("]", "").split(',');

    List<int> offersSavedIntList =
        offersSavedList.map((e) => int.parse(e.trim())).toList();

    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      profilePhoto: json['profile_photo'] as String,
      offersSaved: offersSavedIntList,
    );
  }
}
