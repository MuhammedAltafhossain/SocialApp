// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:social_app/src/models/app_classes/app_data_model.dart';
import 'package:social_app/src/models/pojo_classes/user_model.dart';

class LocalDataModel {
  UserModel? user;
  AppDataModel appSetting;
  LocalDataModel({
    this.user,
    required this.appSetting,
  });

  LocalDataModel copyWith({
    UserModel? user,
    AppDataModel? appSetting,
  }) {
    return LocalDataModel(
      user: user ?? this.user,
      appSetting: appSetting ?? this.appSetting,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userModel': user?.toMap(),
      'appSetting': appSetting.toMap(),
    };
  }

  factory LocalDataModel.fromMap(Map<String, dynamic> map) {
    return LocalDataModel(
      user: map['userModel'] != null ? UserModel.fromMap(map['userModel'] as Map<String, dynamic>) : null,
      appSetting: AppDataModel.fromMap(map['appSetting'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalDataModel.fromJson(String source) => LocalDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocalDataModel(userModel: $user, appSetting: $appSetting)';

  @override
  bool operator ==(covariant LocalDataModel other) {
    if (identical(this, other)) return true;

    return other.user == user && other.appSetting == appSetting;
  }

  @override
  int get hashCode => user.hashCode ^ appSetting.hashCode;
}
