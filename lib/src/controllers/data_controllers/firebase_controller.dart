import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_app/src/controllers/services/firebase/firebase_handler.dart';
import 'package:social_app/src/models/pojo_classes/user_model.dart';

class FirebaseController extends GetxController {
  final FirebaseHandle _firebaseHandle = FirebaseHandle();

  init() async {
    await _firebaseHandle.init();
  }

  Future<void> readUserData() async {
    if (FirebaseAuth.instance.currentUser != null) await FirebaseAuth.instance.currentUser?.reload();
  }
}
