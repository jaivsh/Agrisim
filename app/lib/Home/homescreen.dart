import 'package:agrisim/AR_View/ARScreen.dart';
import 'package:agrisim/Authentication/login.dart';
import 'package:agrisim/Home/FarmDetailsScreen.dart';
import 'package:agrisim/NewFarmScreens/fetchingdatascreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Authentication/signup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),elevation: 0,backgroundColor: Color(0xFFE8FFEC),title: Center(child:Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset('assets/images/leaf.png', width: 25, height: 25,fit: BoxFit.cover,), Text('AgriSim', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),)],)),centerTitle: true,),

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
      backgroundColor: Color(0xFFE8FFEC),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FetchingDataScreen()),);
      }, child: const Icon(Icons.add,color: Colors.black,),backgroundColor: Color(0xFFADE1B6),),
      body: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
         const SizedBox(height: 10,),
          const Center(child: Text('YOUR FARMS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          SizedBox(height: 5,),
          Card(
              color: const Color(0xFFADE1B6),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),

              ),

              elevation: 4,
              child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,

                  child: Padding(padding: EdgeInsets.all(10),child:Column(

                    children: [
                      SizedBox(height: 10,),
                      Center(child: Text('FARM 1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
                      SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        Text('CROP TYPE: '), SizedBox(width: 10,), Text('Potato')
                      ],)



                    ],
                  ),
                  ))
          ),


        ],),
      ),

    );
  }
}


