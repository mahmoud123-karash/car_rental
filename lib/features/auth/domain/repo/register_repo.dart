import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterRepo {
  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return user.user!.uid;
  }

  void addUserToCloud({
    required String collection,
    required Map<String, dynamic> data,
    required String uid,
  }) async {
    await FirebaseFirestore.instance.collection(collection).doc(uid).set(
          data,
        );
  }
}
