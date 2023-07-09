import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/src/controllers/services/handle_error/app_exceptions.dart';
import 'package:social_app/src/models/app_classes/app_data_model.dart';
import 'package:social_app/src/models/app_classes/local_data_model.dart';

class LocalData extends GetxController {
  SharedPreferences? _sharedPreferences;
  final String _dataString = "data";

  Future<LocalDataModel> initData() async {
    if (kDebugMode) print("LocalData: Loading local data.");
    _sharedPreferences = await SharedPreferences.getInstance();

    LocalDataModel localDataModel = LocalDataModel(appSetting: AppDataModel());

    //! Getting data
    String metaData = _sharedPreferences?.getString(_dataString) ?? "";
    if (metaData.isNotEmpty) localDataModel = LocalDataModel.fromJson(jsonDecode(metaData));

    return localDataModel;
  }

  Future<void> setData(LocalDataModel? data) async {
    bool res = true;

    if (data == null) {
      if (kDebugMode) print("LocalData:Resetting data");
      res = await _sharedPreferences?.setString(_dataString, "") ?? false;
    } else {
      if (kDebugMode) print("LocalData:Writing data");
      res = await _sharedPreferences?.setString(_dataString, jsonEncode(data.toJson())) ?? false;
    }

    if (!res) InternalError(message: "Local storage error.");
  }
}
