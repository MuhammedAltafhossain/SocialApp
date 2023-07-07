// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final String userName;
  final String profileUrl;
  final String token;
  final DateTime? lastActiveDateTime;
  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.userName,
    this.profileUrl = "",
    required this.token,
    this.lastActiveDateTime,
  });

  UserModel copyWith({
    String? userId,
    String? fullName,
    String? email,
    String? userName,
    String? profileUrl,
    String? token,
    DateTime? lastActiveDateTime,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      profileUrl: profileUrl ?? this.profileUrl,
      token: token ?? this.token,
      lastActiveDateTime: lastActiveDateTime ?? this.lastActiveDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'userName': userName,
      'profileUrl': profileUrl,
      'token': token,
      'lastActiveDateTime': lastActiveDateTime?.millisecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toCloud() {
    return <String, dynamic>{
      // 'userId': userId,
      'fullName': fullName,
      'email': email,
      'userName': userName,
      'profileUrl': profileUrl,
      'token': token,
      'lastActiveDateTime': 0,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? "",
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      userName: map['userName'] as String,
      profileUrl: map['profileUrl'] as String,
      token: map['token'] as String,
      lastActiveDateTime: map['lastActiveDateTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['lastActiveDateTime'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userId: $userId, fullName: $fullName, email: $email, userName: $userName, profileUrl: ${profileUrl.length}, token: ${token.length}, lastActiveDateTime: $lastActiveDateTime)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.fullName == fullName && other.email == email && other.userName == userName && other.profileUrl == profileUrl && other.token == token && other.lastActiveDateTime == lastActiveDateTime;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ fullName.hashCode ^ email.hashCode ^ userName.hashCode ^ profileUrl.hashCode ^ token.hashCode ^ lastActiveDateTime.hashCode;
  }
}
