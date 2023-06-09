import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
   TaskDetailsPage({Key? key});

  final _auth  = FirebaseAuth.instance;
  final taskRefer = FirebaseFirestore.instance.collection("moreTask");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: StreamBuilder(
        stream: taskRefer.where('userId',isEqualTo: _auth.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final tasks = snapshot.data!.docs;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing:10,childAspectRatio: 0.7 ),
              itemCount: tasks.length,
               itemBuilder: (BuildContext context,int index) {
                return taskCard(taskMap: tasks[index]);
               },);
              
          }
          else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }


//   Padding detailsWidget({QueryDocumentSnapshot<Map<String,dynamic>>? taskMap}){
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Card(
//         elevation: 5,
//         margin: EdgeInsets.all(4),
//       child: Column(children: [
//  Image.network(taskMap["taskImage"][0].toString(),width: 50,height: 50,),
//       Padding(
//         padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
//         child: Text(taskMap["title"].toString(),
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 19,
//         ),),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 5,left: 8,right: 8),
//         child: Text(taskMap['description'].toString()),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 8),
//         child: Text(taskMap['duration'].toString()),
//       )
//       ],),
//       ),
//     );
//   }
}
class taskCard extends StatelessWidget {
   taskCard({Key? key,required this.taskMap}):super(key: key);
  final QueryDocumentSnapshot<Map<String,dynamic>> taskMap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(4),
      child: Column(children: [
 Image.network(taskMap["taskImage"][0].toString(),width: 80,height: 80,),
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
        child: Text(taskMap["title"].toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5,left: 8,right: 8),
        child: Text(taskMap['description'].toString()),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 8),
        child: Text(taskMap['duration'].toString()),
      )
      ],),
      ),
    );
  }
}