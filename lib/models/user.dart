class User {
  String uid;
  String? displayName;
  String? photoUrl;
  User({
    required this.uid,
    this.displayName,
    this.photoUrl,
  });

  @override
  int get hashCode => uid.hashCode ^ displayName.hashCode ^ photoUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.photoUrl == photoUrl;
  }

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

  @override
  String toString() =>
      'User(uid: $uid, displayName: $displayName, photoUrl: $photoUrl)';
}
