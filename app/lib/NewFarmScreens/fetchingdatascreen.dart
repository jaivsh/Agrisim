
import 'dart:io';
import 'package:agrisim/AR_View/ARScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import '../Home/FarmDetailsScreen.dart';

class FetchingDataScreen extends StatefulWidget {
  const FetchingDataScreen({Key? key}) : super(key: key);

  @override
  State<FetchingDataScreen> createState() => _FetchingDataScreenState();
}

class _FetchingDataScreenState extends State<FetchingDataScreen> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8FFEC),
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),elevation: 0,backgroundColor: Color(0xFFE8FFEC),title: Center(child:Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset('assets/images/leaf.png', width: 25, height: 25,fit: BoxFit.cover,), Text('AgriSim', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),)],)),centerTitle: true,actions: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFADE1B6),
          child: Text(
            "J",
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ), //Text
        ),
        SizedBox(width: 8,),//circleAvatar
      ],),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
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
      ), //Draw,
      body: Container(padding: EdgeInsets.symmetric(horizontal: 10),child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          const Center(child: Text('Fetching Data', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
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
                      
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center
                        ,children: [
                        Icon(FontAwesomeIcons.cloud),
                        SizedBox(width: 20,),
                        Text('Arial View ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20 ),), SizedBox(width: 60,), Icon(FontAwesomeIcons.checkCircle, )
                      ],)



                    ],
                  ),
                  ))
          ),
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

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center
                        ,children: [
                          Icon(FontAwesomeIcons.solidSquare),
                          SizedBox(width: 20,),
                          Text('Details', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20 ),), SizedBox(width: 60,),
                        ],),
                      SizedBox(height: 20,),
                      Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,children: [
                        Icon(FontAwesomeIcons.droplet), SizedBox(width: 10,),Text('Land Details', style: TextStyle(fontWeight: FontWeight.bold),), SizedBox(width: 50,),Icon(FontAwesomeIcons.checkCircle)
                      ],),),
                      SizedBox(height: 15,),
                      Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,children: [
                        Icon(FontAwesomeIcons.droplet), SizedBox(width: 10,),Text('Soil Details  ', style: TextStyle(fontWeight: FontWeight.bold),), SizedBox(width: 50,),Icon(FontAwesomeIcons.checkCircle)
                      ],),),
                      SizedBox(height: 15,),
                      Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,children: [
                        Icon(FontAwesomeIcons.droplet), SizedBox(width: 10,),Text('Crop Details', style: TextStyle(fontWeight: FontWeight.bold),), SizedBox(width: 50,),Icon(FontAwesomeIcons.checkCircle)
                      ],),),
                      SizedBox(height: 15,),
                      Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,children: [
                        Icon(FontAwesomeIcons.droplet), SizedBox(width: 10,),Text('Climate \nDetails         ', style: TextStyle(fontWeight: FontWeight.bold),), SizedBox(width: 50,),Icon(FontAwesomeIcons.checkCircle)
                      ],),)



                    ],
                  ),
                  ))
          ),
          SizedBox(height: 20,),
          const Center(child: Text('User Input', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
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

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center
                        ,children: [
                          Icon(FontAwesomeIcons.tractor),
                          SizedBox(width: 20,),
                          Text('Land View ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20 ),), SizedBox(width: 60,), ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ARScreen()));

                          }, child: Icon(FontAwesomeIcons.camera))
                        ],)



                    ],
                  ),
                  ))
          ),
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

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center
                        ,children: [
                          Icon(FontAwesomeIcons.wheatAlt),
                          SizedBox(width: 20,),
                          Text('Crop View ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20 ),), SizedBox(width: 60,), ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: () {
                            getcam();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FarmDetailScreen()));



                          }, child: Icon(FontAwesomeIcons.camera))
                        ],)



                    ],
                  ),
                  ))
          ),

        ],
      ),),
    );
  }
  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3

    return filePath;
  }

  void saveFile() async {
    File f = File(await getFilePath());
    f.writeAsBytes(file as List<int>);// 1; // 2
  }

  getcam() async{
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
}
