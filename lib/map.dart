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
import 'package:prototype_application_1/feedback.dart';
import 'package:prototype_application_1/map.dart';
import 'package:prototype_application_1/note.dart';

// In which i create the map class 
 
class map extends StatefulWidget {
  
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
 

 //Here i sed the current location is osm map

  LatLng point = LatLng(50.827847, 12.921370);
  late String address;
  int level=0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     body:
         FlutterMap (
          options: MapOptions(

            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names,

            onTap: (Polyline,p) async{
            
              setState(() {
                point=p;
                List<String> value =[p.latitude.toString(),p.longitude.toString() ];
                String lat=p.latitude.toString();
                String lon = p.longitude.toString();

                // In the part you can see that I call the Noteinsert means note. dart file when the user enters the note and clicks on submit
                // button directly saves to the exact location that the user can select earlier.

                final data=NoteInsert(lat: p.latitude.toString(),lon: p.longitude.toString(),note: "");
                Navigator.of(context).push(MaterialPageRoute(

                  // Here you can see that when the user clicks on the map and selects the location it directly goes to the feed. dart page which consists of UI 

                  builder: (context)=>feedback(lat:lat,lon:lon)));
              });

            },
            center: LatLng(50.827847, 12.921370),
            zoom: 13,
          ),

          //map layers for upload the map in Flutter,
          
          layers: [

            //Here I used the tile layer  which is required for the map because when I show the map on frontend I used this layer and in this 
           // layer i used marker to show the current location with the red point
             
            TileLayerOptions(
                urlTemplate:

                //Map Implementation in the code

                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              
              //Marking of the map,

              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: point,
                  builder: (ctx) => Container(
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
    );
  }
}

