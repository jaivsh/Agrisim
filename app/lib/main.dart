import 'package:agrisim/Authentication/login.dart';
import 'package:agrisim/Authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Home/FarmDetailsScreen.dart';
import 'Home/homescreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checked = false;
  String name = '';
  String phone = '';


  void checkval() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var k = await preferences.getString('UserPhone');
    if(k == null) {
      checked = false;
    }
    else{
      checked = true;
      name = await preferences.getString('UserName')!;
      phone = await preferences.getString('UserPhone')!;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkval();


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(


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
        body: LoginScreen(),
      ),
    );
  }
}

