import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  // Signin User
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception((e.code));
    }
  }

  // Signup user

  Future<UserCredential> signUpUserWithEmailandPassword(String email, String password) async{
    try{
      UserCredential userCredential=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception((e.code));
    }
  }
  // Logout User
  Future<void> signOut()async {
    return await FirebaseAuth.instance.signOut();
  }
}
