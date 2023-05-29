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
            TextButton(onPressed: () {}, child: Text("Add more tasks")),
            Divider(),
        //  Expanded(child: StreamBuilder(builder: (BuildContext context, snapshot) {
        //    return ListView.builder(itemBuilder: (context, index) {
             
        //    },);
        //  },),),
          ],
        ),
      ),
    );
  }

 Padding  taskTile() {
    return    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  Row(
                    children: [
                      Column(children: [
                        Text("task1"),
                        Text("Aadasd")
                      ],),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.blue,)),
                                            IconButton(onPressed: (){}, icon: Icon(Icons.delete)),

                    ],
                  );
                },
               
              ),
    );
  }
}
