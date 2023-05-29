import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoo/app/app.dart';
import 'package:todoo/bootstrap.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  bootstrap(() => const App());
}
