import 'dart:async';
import 'dart:convert';
import '';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:expandable/expandable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../MapScreen.dart';

class FarmDetailScreen extends StatefulWidget {
  const FarmDetailScreen({Key? key}) : super(key: key);

  @override
  State<FarmDetailScreen> createState() => _FarmDetailScreenState();
}

class _FarmDetailScreenState extends State<FarmDetailScreen> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  double lat = 0;
  double lng = 0;
  double windspeed = 0;
  int humidity = 0;
  double temp_c=0;
  double temp_f=0;
  double precip_mm=0;

  Future<void> getcoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
     lat = position.latitude;
     lng = position.longitude;
     String link = "https://api.weatherapi.com/v1/current.json?key=641f9d019e314ed7a24172012232308&q=$lat,$lng&aqi=no";
    final response = await http.get(Uri.parse(link));

    Map<String, dynamic> responseJson = json.decode(response.body.toString());
    windspeed = responseJson['current']['wind_kph'];
    humidity = responseJson['current']['humidity'];
    precip_mm = responseJson['current']['precip_mm'];
    temp_c = responseJson['current']['temp_c'];
    temp_f = responseJson['current']['feelslike_c'];


    String finalurl = 'http://127.0.0.1:8080/api/v1/shc/1234567890';
    final res = await http.get(Uri.parse(finalurl));
    Map<String, dynamic> resj = json.decode(res.body.toString());

    var nitrogen = resj['data']['nitrogen'];

    var potassium = resj['data']['potassium'];

    var phosphorous = resj['data']['phosphorus'];

    var zinc = resj['data']['zinc'];

    var iron = resj['data']['iron'];

    var copper = resj['data']['copper'];

    var manganese = resj['data']['manganese'];

    var barium = resj['data']['barium'];

    var ph = resj['data']['ph'];

    var oc = resj['data']['oc'];

    var ec = resj['data']['ec'];


    setState(() {
      windspeed;
      humidity;
      precip_mm;
      temp_c;
      temp_f;
    });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcoordinates();

  }
  @override
  Widget build(BuildContext context) {
    return humidity==0.0?Center(child: CircularProgressIndicator(),):Scaffold(
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
                  "Jaiardhan Shukla",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("+919555635019"),

              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
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



        ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.blue,
            useInkWell: true,
          ),
          child: Expanded(child:ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              c1(),
              c2(),
              c3(),
              c4(),


            ],
          ),
        )),


        ],
      ),));

  }

  Widget c1 () {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[

                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      iconColor: Colors.white,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Container(color: Colors.green,child:Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Land Details",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
                    collapsed: Text(
                      'View details related to your land!', style: TextStyle(color: Colors.white),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Total Area', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("98.78" + " sq. m")],)))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Coordinates', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text(lat.toString() + " , " + lng.toString())],)))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Average Annual \nRainfall', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("803 mm")],)))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Altitude above \nSea level', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("537 m")],)))
                        ],),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget c2() {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[

                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      iconColor: Colors.white,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Container(color: Colors.green,child:Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Soil Details",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
                    collapsed: Text(
                      'View details related to your soil!', style: TextStyle(color: Colors.white),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Center(child: Text('MACRO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Nitrogen', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("0.05 %")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Potassium', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("2.3 %")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Phosphorous', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("0.6 %")],)))
                          ],),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Center(child: Text('MICRO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Zinc', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("212.98129 ppm")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Iron', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("480000 mg/kg")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Copper', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("99 ppm")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Manganeese', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("882 ppm")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('Barium', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("27 mg/kg")],)))
                          ],),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Center(child: Text('PHYSICAL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('pH', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("8.32")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('EC', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("1.1")],)))
                          ],),
                          SizedBox(height: 10,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                            Text('DC', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text("2.0")],)))
                          ],),
                        ],
                      ),
                    ],),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget c3() {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[

                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      iconColor: Colors.white,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Container(color: Colors.green,child:Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Crop Details",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
                    collapsed: Text(
                      'View details related to your crop!', style: TextStyle(color: Colors.white),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                                color: Color(0xFFE8FFEC),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),

                                ),

                                elevation: 4,
                                child:Column(children: [SizedBox(

                                  width: MediaQuery.of(context).size.width/2-80,
                                  height: 120,
                                  child:// GoogleMap(
                                  //mapType: MapType.hybrid,
                                  //initialCameraPosition: CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 15),
                                  //),
                                  Text(''),


                                ),

                                ])),
                            SizedBox(width: 15,),
                            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Crop Name'),
                                SizedBox(height: 2,),
                                Text('Brinjal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                Text('Current Stage'),
                                SizedBox(height: 2,),
                                Text('Flowering', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                Text('Current Market Price'),
                                SizedBox(height: 2,),
                                Text('2823.65/Quintal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)
                              ],)



                          ],)

                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget c4() {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[

                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      iconColor: Colors.white,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Container(color: Colors.green,child:Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Climate Details",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ))),
                    collapsed: Text(
                      'View details related to the climate around farm!', style: TextStyle(color: Colors.white),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Wind Speed', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text(windspeed.toString() + ' km/h')],),))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Rainfall', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text(precip_mm.toString() + ' mm')],)))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Min. \nTemperature', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text(temp_c.toString() + ' degree Celcius')],)))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Max. \nTemperature', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text(temp_f.toString() + ' degree celcius')],)))
                        ],),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Text('Max. \nRelative \nHumidity', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),), SizedBox(width: 10,), Material(elevation: 10,child:Container(width: 200,height:50,color:Color(0xFFE8FFEC) ,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text(humidity.toString() + ' %')],)))
                        ],),

                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void apicall() async {


  }
}


