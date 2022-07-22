import 'dart:async';
import 'dart:convert';
import 'package:demo_project_2/API.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Geolocation extends StatefulWidget {
  const Geolocation({Key? key}) : super(key: key);

  @override
  _GeolocationState createState() => _GeolocationState();
}

class _GeolocationState extends State<Geolocation> {

  late String address;
  int level=0;
  String lat='';
  String lon='';
  fetchLocation() async {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  var location = new Location();
  var serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  
  var currentPosition = await location.getLocation();
  lat=(currentPosition.latitude).toString();
  lon=(currentPosition.longitude).toString();
  print(lat);
  print(lon);
  }


  @override
  void StepState() {
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation'),
        
      ),
     floatingActionButton: FloatingActionButton(onPressed: (){
       setState(() {
         fetchLocation();
       });

     },
     child: Icon(Icons.add),
     backgroundColor: Colors.grey[800],
     ),
     body:ListView(
      children: [
        Card(
          child: ListTile(
            title: Text('$lat'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('$lon'),
          ),
        ),
      ],
      padding: EdgeInsets.all(10),        
     )
    );
  }
}

