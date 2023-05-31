import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingTaskNameController =
      TextEditingController();
  TextEditingController _textEditingTaskDescriptionController =
      TextEditingController();
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final FirebaseAuth _auth = FirebaseAuth.instance;
      late  CollectionReference todoRef;

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoRef = _firestore.collection('todoTask');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Add your task title and description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: _textEditingTaskNameController,
                decoration: InputDecoration(hintText: "Title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                controller: _textEditingTaskDescriptionController,
                decoration: InputDecoration(hintText: "Description"),
              ),
            ),
            TextButton(onPressed: () async{
                await todoRef.add({
                  "title":_textEditingTaskNameController.text,
                  "description":_textEditingTaskDescriptionController.text,
                  "userId":_auth.currentUser!.uid,
                });
                _textEditingTaskNameController.clear();
                _textEditingTaskDescriptionController.clear();
            }, child: Text("Add")),
            Divider(),

             Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: todoRef.where("userId",isEqualTo: _auth.currentUser!.uid).snapshots(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(!snapshot.hasData){
                  return  Center(child: CircularProgressIndicator());
                  }
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
               return ListView.builder(
                itemCount: documents.length,
                itemBuilder:  (BuildContext context,int index) {
                final document = documents[index];
                 return ListTile(
             title: Text(document["title"]),
                 );
               },);
             },),),
          ],
        ),
      ),
    );
  }

  Padding taskTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Column(
                children: [Text("task1"), Text("Aadasd")],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          );
        },
      ),
    );
  }
}
