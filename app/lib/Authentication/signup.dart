import 'package:agrisim/Home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFADE1B6),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/leaf.png'),
            SizedBox(height: 30,),
            Center(child: Text('SIGNUP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
            SizedBox(height: 20,),
            Center(child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold),),),
            SizedBox(height: 10,),
            TextField(controller: namecontroller,decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),),
            SizedBox(height: 20,),
            Center(child: Text('Mobile Input', style: TextStyle(fontWeight: FontWeight.bold),),),
            SizedBox(height: 10,),
            TextField(controller: phonecontroller,decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your mobile',
            ),),
            SizedBox(height: 20,),
            Center(child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold),),),
            SizedBox(height: 10,),
            TextField(controller: emailcontroller,decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your e-mail',
            ),),
            SizedBox(height: 30,),
            SizedBox(width: MediaQuery.of(context).size.width,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.green),onPressed: () async {
              if(namecontroller.text.isNotEmpty && phonecontroller.text.isNotEmpty && emailcontroller.text.isNotEmpty) {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.setString('UserName', namecontroller.text);
                await preferences.setString('UserEmail', emailcontroller.text);
                await preferences.setString('UserPhone', phonecontroller.text);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));


              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("One or more fields is empty!"),
                ));

              }
            },child: Text('SUBMIT'),),),
            SizedBox(height: 20,),
            Center(child: TextButton(onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));

            },child: Text('Login Instead', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),),)
          ],
        ),
      ),
    );
  }
}
