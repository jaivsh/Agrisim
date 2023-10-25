import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition vegasPosition = CameraPosition(target: LatLng(36.0953103, -115.1992098), zoom: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GMap'),),
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: vegasPosition,
        ),
      );

  }
}
