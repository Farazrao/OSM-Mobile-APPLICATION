
//Here I import all the libraries
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

// Here i call call the page feedback.dart 

import 'package:prototype_application_1/feedback.dart';

// Here i call call the page list.dart  

import 'package:prototype_application_1/list.dart';

// Here i call the page map.dart  which is actually a osm map

import 'package:prototype_application_1/map.dart';

//create StatefulWidget

class secondscreen extends StatefulWidget {

  @override
  _secondscreenState createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {

  //give the index value for calling the different pages,
  
 int _currentIndex = 1;
 final List<Widget> _children =
 [
   //first i call list the map the feedback,

   list(),
   map(),
   feedback(lat:"50.827847",lon:"12.921370"),
 
  
   
 ];
 void onTappedBar (int index)
 {
   setState(() {
     _currentIndex = index;
   });
 }



  //set the current location in osm,

  LatLng point = LatLng(50.827847, 12.921370);
  late String address;
  int level=0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       body: 
      _children[_currentIndex],

      //create bottomNavigationBar,

      bottomNavigationBar:BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,

        //Three diferent icons of the three different pages shows on the bottomNavigation Bar,
        //first item called list show in bottomNavigation Bar,

         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'list',
            backgroundColor: Colors.red,
            
          ),

          //Second item called Map show in bottomNavigation Bar,
          
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
            backgroundColor: Colors.green,
          ),

          //Third item called Feedback show in bottomNavigation Bar,

          BottomNavigationBarItem(
            
            icon: Icon(Icons.feedback),
            label: 'feedback',
            backgroundColor: Colors.purple,
          ),
         ],
         
       ) ,
     );
     
  }
}
