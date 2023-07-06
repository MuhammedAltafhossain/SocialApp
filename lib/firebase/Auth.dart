import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:social_app/src/models/user_model.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String? token = await FirebaseMessaging.instance.getToken();
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    DocumentReference userDocument =
        usersCollection.doc(userCredential.user!.uid);
    userDocument.update({
      'token': token, // Example: updating the 'name' field
    });
    fetchUserData(userCredential.user!.uid).then((value) {
      if (value != null) {
        UserModel.userName = value['userName'];
        UserModel.email = value['email'];
        UserModel.token = value['token'];
        UserModel.userName = value['userName'];
      }
    });
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> fetchUserData(
      String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return userDoc;
    } catch (e) {
      // Handle error
      log('Error fetching user data: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
