import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoo/home/view/home_page.dart';

class LoginDetailsPage extends StatefulWidget {
  const LoginDetailsPage({super.key});

  @override
  State<LoginDetailsPage> createState() => _LoginDetailsPageState();
}

class _LoginDetailsPageState extends State<LoginDetailsPage> {
  TextEditingController _textEditingEmailIdController = TextEditingController();
  TextEditingController _textEditingPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
                SizedBox(
                height: 70,
              ),
              Center(
                child: Text("Enter your email and password to Login",
                style: TextStyle(
                   color: Colors.purple.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                ),),
              ),
        loginCredentials(text: "Enter your email id",controller: _textEditingEmailIdController,type: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty){
            return "Please  fill this field";
          }
        },),
        loginCredentials(text: "Enter your password",controller: _textEditingPasswordController,type: TextInputType.visiblePassword,
        validator: (value) {
          if(value!.isEmpty){
            return "Please  fill this field";
          }
        },),
          
          SizedBox(
            height: 30,
          ),
          TextButton(onPressed: (){}, child: Text("Forgot password?")),
          ElevatedButton(
            
            onPressed: () async{
            try {
              final _auth = FirebaseAuth.instance;
              final userReference = await _auth.signInWithEmailAndPassword(email: _textEditingEmailIdController.text,
               password: _textEditingPasswordController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password")));
            }
             
            }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
 Padding loginCredentials({String? text, TextEditingController? controller,TextInputType? type,String? Function(String?)? validator}){
    return Padding(
      padding: const EdgeInsets.only(top: 30,left: 18,right: 18),
      child: TextFormField(
        validator: validator,
    controller:controller ,
    decoration: InputDecoration(
      hintText: text
    ),
    keyboardType: type,
      ),
    );
  }
}
