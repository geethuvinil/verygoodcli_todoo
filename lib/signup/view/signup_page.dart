import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _textEditingNameController = TextEditingController();
  TextEditingController _textEditingEmailController = TextEditingController();
  TextEditingController _textEditingNumberController = TextEditingController();
  TextEditingController _textEditingPasswordController =
      TextEditingController();

      final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Enter your details to Sign up",
                style: TextStyle(
                    color: Colors.purple.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
             signupDetails(text:"Enter your name",keyboardType: TextInputType.name,controller: _textEditingNameController,
             validator:(value) {
               if(value!.isEmpty){
                return "Please fill this field";
               }
             },),
             signupDetails(text:"Enter your mail address",keyboardType: TextInputType.emailAddress ,controller: _textEditingEmailController,
             validator:(value) {
               if(value!.isEmpty){
                return "Please fill this field";
               }
             }, ),
                      signupDetails(text:"Enter your phone number",keyboardType: TextInputType.number,controller: _textEditingNumberController,
                      validator: (value) {
               if(value!.isEmpty){
                return "Please fill this field";
               }
             }, ),
                               signupDetails(text:"Enter your password",keyboardType: TextInputType.visiblePassword ,controller: _textEditingPasswordController,
                               validator: (value) {
               if(value!.isEmpty){
                return "Please fill this field";
               }
             },),
              
                              SizedBox(height: 50,),
                               ElevatedButton(onPressed: (){}, child: Text("REGISTER"))
              
              
            ],
          ),
        ),
      ),
    );
  }

  Padding signupDetails({String? text,TextInputType? keyboardType,TextEditingController? controller,String? Function(String?)? validator}){
    return  Padding(
            padding: const EdgeInsets.only(top: 25,left: 18,right: 18),
            child: TextFormField(
            controller: controller,
              decoration: InputDecoration(
                hintText: text,
              ),
             validator: validator,
              keyboardType: keyboardType
            ),
          );
  }
}
