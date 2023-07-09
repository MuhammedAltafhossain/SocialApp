// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppDataModel {
  bool showOnBoardScreen;

  AppDataModel({
    this.showOnBoardScreen = true,
  });

  AppDataModel copyWith({
    bool? showOnBoardScreen,
  }) {
    return AppDataModel(
      showOnBoardScreen: showOnBoardScreen ?? this.showOnBoardScreen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'showOnBoardScreen': showOnBoardScreen,
    };
  }

  factory AppDataModel.fromMap(Map<String, dynamic> map) {
    return AppDataModel(
      showOnBoardScreen: map['showOnBoardScreen'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppDataModel.fromJson(String source) => AppDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppDataModel(showOnBoardScreen: $showOnBoardScreen)';

  @override
  bool operator ==(covariant AppDataModel other) {
    if (identical(this, other)) return true;

    return other.showOnBoardScreen == showOnBoardScreen;
  }

  @override
  int get hashCode => showOnBoardScreen.hashCode;
}
