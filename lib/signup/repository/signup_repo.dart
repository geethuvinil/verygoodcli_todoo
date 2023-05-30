import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupRepo{
  Future <void> createUser(String name, String email, String phoneNumber,String password,BuildContext context) async{
final _auth = FirebaseAuth.instance;
final CollectionReference userReference = FirebaseFirestore.instance.collection("userCollection");
try {
  final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  await userReference.doc(userCredential.user!.uid).set({
    'userId':_auth.currentUser!.uid,
    'userName':name,
    'emailId':email,
    'phoneNumber':phoneNumber,
    'password':password
  });
}on FirebaseAuthException catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
}
  }
  
}