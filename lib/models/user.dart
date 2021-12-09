import 'dart:convert';

class User {
  String uid;
  String? displayName;
  String? photoUrl;

  User({
    required this.uid,
    this.displayName,
    this.photoUrl,
  });

  User copyWith({
    String? uid,
    String? displayName,
    String? photoUrl,
  }) {
    return User(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserEntity(uid: $uid, displayName: $displayName, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => uid.hashCode ^ displayName.hashCode ^ photoUrl.hashCode;
}
