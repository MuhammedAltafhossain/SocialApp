import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

WriteData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user?.uid;
  String usertype = '';
  print(uid);
  await db.collection('users').doc(uid).get().then((DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    print(data);
    usertype = data['usertype'];
  });
  await prefs.setString('usertype', usertype);
}

class LocalData extends GetxController {
  SharedPreferences? _sharedPreferences;
  final String isSeller = "isActive";

  Future<bool> initData() async {
    if (kDebugMode) print("LocalData: Loading local user data.");
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isActive = _sharedPreferences?.getBool(isSeller) ?? false;
    if (kDebugMode) print("LocalData: isSeller = $isActive");
    return isActive;
  }

  setIsSeller(bool isActive) {
    if (kDebugMode) print("LocalData: isSeller = $isActive");
    _sharedPreferences?.setBool(isSeller, isActive);
  }
}
