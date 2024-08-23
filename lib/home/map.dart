import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.80952157084279, 10.173844886603172),
    zoom: 14.4746,
  );

/*  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(


        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.red,
        leading: IconButton(
        onPressed: () {
      Navigator.pop(context);
           },
           icon: Icon(Icons.arrow_back_ios,
             size: 20,
             color: Colors.black,),
        ),
        ),


            body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
          ),
       /* floatingActionButton: FloatingActionButton(
          onPressed: (){}  ,     // _goToTheLake,
        //label: Text('§'),
          backgroundColor: Colors.red,

         child:  Icon(Icons.add_location),
      )

        */
    );
  }

  /*Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

  }

   */


  }


