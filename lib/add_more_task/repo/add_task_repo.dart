import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    for(final element in images ){
final  tRef = FirebaseStorage.instance.ref().child("Product_image").child(element.name);
final  file = File(element.path);
await tRef.putFile(file);
final taskImage = await tRef.getDownloadURL();
taskImages.add(taskImage);
    }
  await taskReference.doc(tId).set({
    'userId':_auth.currentUser!.uid,
    'title':title,
    'description':description,
    'duration':duration,
    'taskImage': taskImages,
    'tId':tId
  });
} catch (e) {
  
}
}
}