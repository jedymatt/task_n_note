import 'dart:convert';

class UserEntity {
  String uid;
  String? displayName;
  String? photoUrl;

  UserEntity({
    required this.uid,
    this.displayName,
    this.photoUrl,
  });

  UserEntity copyWith({
    String? uid,
    String? displayName,
    String? photoUrl,
  }) {
    return UserEntity(
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

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'],
      displayName: map['displayName'] != null ? map['displayName'] : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserEntity(uid: $uid, displayName: $displayName, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => uid.hashCode ^ displayName.hashCode ^ photoUrl.hashCode;
}
