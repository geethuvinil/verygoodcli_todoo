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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
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
loginCredentials(text: "Enter your email id",controller: _textEditingEmailIdController,type: TextInputType.emailAddress),
loginCredentials(text: "Enter your password",controller: _textEditingPasswordController,type: TextInputType.visiblePassword),
        
        SizedBox(
          height: 30,
        ),
        TextButton(onPressed: (){}, child: Text("Forgot password?")),
        ElevatedButton(
          
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
 Padding loginCredentials({String? text, TextEditingController? controller,TextInputType? type}){
    return Padding(
      padding: const EdgeInsets.only(top: 30,left: 18,right: 18),
      child: TextField(
    controller:controller ,
    decoration: InputDecoration(
      hintText: text
    ),
    keyboardType: type,
      ),
    );
  }
}
