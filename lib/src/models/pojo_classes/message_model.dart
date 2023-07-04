import 'dart:convert';

import 'package:flutter/foundation.dart';

class MessageModel {
  String userId;
  DateTime messageTime;
  String message;
  List<String> emoji;
  MessageModel({
    required this.userId,
    required this.messageTime,
    this.message = "",
    List<String>? emoji,
  }) : emoji = emoji ?? [];

  MessageModel copyWith({
    String? userId,
    DateTime? messageTime,
    String? message,
    List<String>? emoji,
  }) {
    return MessageModel(
      userId: userId ?? this.userId,
      messageTime: messageTime ?? this.messageTime,
      message: message ?? this.message,
      emoji: emoji ?? this.emoji,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'messageTime': messageTime.millisecondsSinceEpoch,
      'message': message,
      'emoji': emoji,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      userId: map['userId'] as String,
      messageTime: DateTime.fromMillisecondsSinceEpoch(map['messageTime'] as int),
      message: map['message'] == null ? "" : map['message'] as String,
      emoji: map['emoji'] == null
          ? []
          : List<String>.from(
              (map['emoji'] as List<String>),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(userId: $userId, messageTime: $messageTime, message: $message, emoji: $emoji)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.messageTime == messageTime && other.message == message && listEquals(other.emoji, emoji);
  }

  @override
  int get hashCode {
    return userId.hashCode ^ messageTime.hashCode ^ message.hashCode ^ emoji.hashCode;
  }
}
