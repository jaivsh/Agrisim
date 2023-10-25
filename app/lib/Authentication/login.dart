import 'package:agrisim/Authentication/signup.dart';
import 'package:agrisim/Home/homescreen.dart';
import 'package:agrisim/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/FarmDetailsScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Jaivardhan Shukla",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("+919555635019"),

              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(FontAwesomeIcons.dashboard),
              title: const Text(' Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.add),
              title: const Text(' Add a Farm '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmDetailScreen()),);
              },
            ),


            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer,
      backgroundColor: Color(0xFFADE1B6),
        appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),elevation: 0,backgroundColor: Color(0xFFE8FFEC),title: Center(child:Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset('assets/images/leaf.png', width: 25, height: 25,fit: BoxFit.cover,), Text('AgriSim', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),)],)),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/leaf.png'),
              SizedBox(height: 30,),
            Center(child: Text('AUTHENTICATE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
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
            SizedBox(height: 30,),
            SizedBox(width: MediaQuery.of(context).size.width,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.green),onPressed: () async {
              if(namecontroller.text.isNotEmpty && phonecontroller.text.isNotEmpty) {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.setString('UserName', namecontroller.text);
                await preferences.setString('UserPhone', phonecontroller.text);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));


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

            },child: Text('New to app? Sign up here!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),),)

          ],
        ),
      ),
    );
  }
}
