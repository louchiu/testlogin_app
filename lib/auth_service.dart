import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<String> get onAuthStateChanged => _auth.authStateChanges().map((User user) => user?.uid,);


  //GET CURRENT UID
  Future<String> getCurrentUID() async {

    return (await _auth.currentUser.uid);
  }

  Future getCurrentU() async {
    final user = await _auth.currentUser;
    return user != null ? user.email : null;

  }
  // //Email and Password sign up
  // Future<String> createUserWithEmailAndPassword(String email, String password, String name) async {
  //   final authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
  //
  //   await updateUserName(name, authResult.user);
  //   return authResult.user.uid;
  // }



}

