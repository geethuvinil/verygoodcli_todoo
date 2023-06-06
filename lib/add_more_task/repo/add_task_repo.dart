import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddTaskRepo{
final _auth = FirebaseAuth.instance;
final CollectionReference taskReference = FirebaseFirestore.instance.collection("moreTask");
Future <void> createMoreTask (String title,String description,String duration,List<XFile> images) async{
final uuid = Uuid();
// final date = DateTime.now();
final tId = uuid.v4();
List <String>? taskImages = [];
try {
    final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  await taskReference.doc(tId).set({
    'userId':_auth.currentUser!.uid,
    'title':title,
    'description':description,
    'duration':duration,
    'tId':tId
  });
} catch (e) {
  
}
}
}