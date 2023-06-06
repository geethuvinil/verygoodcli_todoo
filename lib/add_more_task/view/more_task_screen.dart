import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MoreTaskScreen extends StatefulWidget {
  const MoreTaskScreen({super.key});

  @override
  State<MoreTaskScreen> createState() => _MoreTaskScreenState();
}

class _MoreTaskScreenState extends State<MoreTaskScreen> {
  TextEditingController _textEditingTitleController = TextEditingController();
    TextEditingController _textEditingDescriptionController = TextEditingController();
      TextEditingController _textEditingDurationController = TextEditingController();
      List<XFile>? images;
      Future <dynamic> addImage() async{
      final imagePicker = ImagePicker();
      images = await imagePicker.pickMultiImage();
      }
      final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add more tasks"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
        addMoreTask(text: "Enter task title",editingController: _textEditingTitleController,validator: (value) {
          if(value!.isEmpty){
            return "Enter a valid title";
          }
        },),
        addMoreTask(text: "Enter task description",editingController: _textEditingDescriptionController,validator: (value) {
          if(value!.isEmpty){
            return "Enter a valid description";
          }
        },),
        addMoreTask(text: "Enter task duration",editingController: _textEditingDurationController,validator: (value) {
          if(value!.isEmpty){
            return "Enter a valid time duration";
          }
        },),
        SizedBox(
          height: MediaQuery.of(context).size.height* .01,
        ),
        TextButton(onPressed: (){
        addImage();
        }, child: Text("Upload Image")),
        SizedBox(
          height: MediaQuery.of(context).size.height* .01,
        ),
        ElevatedButton(onPressed: () {
          
        }, child: Text("Add more tasks!"))
        
        
          ],),
        ),
      ),
    );
  }

Padding addMoreTask({String? text,TextEditingController? editingController, String? Function(String?)? validator}){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
  controller: editingController,
  validator: validator,
  decoration: InputDecoration(
    hintText: text
  ),
    ),
  );
}
}