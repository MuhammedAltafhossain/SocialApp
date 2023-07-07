import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_app/src/controllers/services/firebase/firebase_options.dart';
import 'package:social_app/src/models/pojo_classes/user_model.dart';

class FirebaseController {
  final String _userString = "users";

  init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> readUserAuth() async {
    if (FirebaseAuth.instance.currentUser != null) await FirebaseAuth.instance.currentUser?.reload();
  }

  //* Sign In
  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  //* Signup
  Future<void> signup(UserModel user, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: password);
      user = user.copyWith(token: await FirebaseAuth.instance.currentUser?.getIdToken());
      await FirebaseFirestore.instance.collection(_userString).doc(userCredential.user?.uid).set(user.toCloud());
    } catch (e) {
      rethrow;
    }
  }

  //* fetch user data
  Future<UserModel> fetchUserData() async {
    try {
      Map<String, dynamic> res = await FirebaseFirestore.instance.collection(_userString).doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) => value.data() ?? {});
      UserModel result = UserModel.fromMap(res);
      result = result.copyWith(userId: FirebaseAuth.instance.currentUser?.uid, lastActiveDateTime: null);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
