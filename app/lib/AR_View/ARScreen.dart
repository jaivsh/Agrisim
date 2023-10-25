import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ARScreen extends StatefulWidget {
  const ARScreen({Key? key}) : super(key: key);

  @override
  State<ARScreen> createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  late ArCoreController arcontroller;

  @override
  void dispose() {
    arcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('AR Capture', style: TextStyle(color: Colors.black),),backgroundColor: Color(0xFFE8FFEC),foregroundColor: Colors.black, centerTitle: true,actions: [IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(FontAwesomeIcons.check))],),
      body: ArCoreView(onArCoreViewCreated: onArCoreViewCreated,
      enableTapRecognizer: true,),
    );
  }

  void onArCoreViewCreated(ArCoreController controller) {
    arcontroller = controller;

    createCylender(arcontroller);
  }

  createCylender(ArCoreController controller) {
    final materials = ArCoreMaterial(
      color: Color(0xFFFF00FF),
      metallic: 2,

    );

    final cylender = ArCoreSphere(materials: [materials]);

    final node = ArCoreNode(
      shape: cylender,
      position: vector64.Vector3(0,0,0)
    );

    arcontroller.addArCoreNode(node);
  }
}
