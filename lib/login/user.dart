class User {
  String email;
  String photoUrl;
  String uid;
  int lastSeen;

  User({this.email, this.photoUrl, this.uid, this.lastSeen});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        email: parsedJson['email'],
        photoUrl: parsedJson['photoUrl'],
        uid: parsedJson['uid'],
        lastSeen: parsedJson['lastSeen']);
  }
}
