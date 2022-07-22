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
class map extends StatefulWidget {
  
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
 
  double long = 49.5;
  double lat = -0.09;
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
                final data=NoteInsert(lat: p.latitude.toString(),lon: p.longitude.toString(),note: "");
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>feedback(lat:lat,lon:lon)));
              });

            },
            center: LatLng(50.827847, 12.921370),
            zoom: 13,
          ),

          //map layers for upload the map in Flutter,
          
          layers: [
            TileLayerOptions(
                urlTemplate:
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

