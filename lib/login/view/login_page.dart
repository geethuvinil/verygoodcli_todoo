import 'package:flutter/material.dart';
import 'package:todoo/login%20Details/view/login_details_page.dart';

import '../../signup/view/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(221, 98, 255, 1)
      ),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSFb0b4D0QjeeepuAa1nmcksjmNSC0dfRijA&usqp=CAU"),fit: BoxFit.fill,opacity: 0.4)),
    child: Column(
      children: [
     Center(
      child: Text("TODO APP",
      style: TextStyle(color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30),),
    ),
Row(
  
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
   ElevatedButton(
     style: ElevatedButton.styleFrom(
backgroundColor: Colors.deepPurple
              ),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDetailsPage(),));
    }, child: Text("Login")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
backgroundColor: Colors.deepPurple
              ),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
            }, child: Text("Sign up")),
],)
     
      ],
    ),),  
    );

  }
}