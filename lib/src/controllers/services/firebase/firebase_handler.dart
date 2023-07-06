import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:social_app/src/controllers/services/firebase/firebase_options.dart';

class FirebaseHandle {
  final String _userString = "users";

  init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseMessaging.instance.requestPermission();
  }
}
