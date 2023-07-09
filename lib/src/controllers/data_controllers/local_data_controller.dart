import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/services/local_data/local_data.dart';
import 'package:social_app/src/models/app_classes/app_data_model.dart';
import 'package:social_app/src/models/app_classes/local_data_model.dart';

class LocalDataController {
  final LocalData _localData = LocalData();
  final Rx<LocalDataModel> localData = LocalDataModel(appSetting: AppDataModel()).obs;

  Future<void> init() async {
    localData.value = await _localData.initData();

    localData.listen((_) {
      if (kDebugMode) print("(Listen) LocalDataController\n${localData.value.appSetting.toString()}\n${localData.value.user.toString()}");
      _localData.setData(localData.value);
    });
  }
}
