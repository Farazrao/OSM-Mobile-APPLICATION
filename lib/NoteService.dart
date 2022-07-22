import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//  Here i connect the page api_response.dart

import 'package:prototype_application_1/api_response.dart';

//  Here i connect the page note.dart

import 'package:prototype_application_1/note.dart';

import 'package:flutter/material.dart';

class NotesService {

  //Set the link of OSM,
  //THIS IS THE DUMMY SERVER OF osm https://master.apis.dev.openstreetmap.org/api/0.6/notes?

  static const API = 'https://master.apis.dev.openstreetmap.org/api/0.6/notes?';

  static const headers = {

 'Content-Type': 'application/json'

  };

 //when the user enters the note it comes to Note service and in note service. dart connected with a note.dart file to save the user note to the 
 // exact selected location in osm 

  Future<APIResponse<String>> createNote(NoteInsert item) {

    return http.post(Uri.parse(API), headers: headers, body: json.encode(item.toJson())).then((http.Response data) {

      print('here');
      print((data.statusCode));
      print(data.body);
       
      //Here i used the if/else statement if the response is received then its store otherwise the erorr will be shown on the screen

      if (data.statusCode == 200) {

        print('-----here---------');
        return APIResponse<String>(data: data.body);
        
      }
      return APIResponse<String>(error: true, errorMessage: 'An error occured');
    })

    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
    
  }
}