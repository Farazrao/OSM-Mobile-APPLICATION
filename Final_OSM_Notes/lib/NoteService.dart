import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prototype_application_1/api_response.dart';
import 'package:prototype_application_1/note.dart';

import 'package:flutter/material.dart';

class NotesService {

  //Set the link of OSM,
  //THIS IS THE DUMMY SERVER OF osm https://master.apis.dev.openstreetmap.org/api/0.6/notes?
  //This is the official link of OSM https://api.openstreetmap.org/api/0.6/notes?

  static const API = 'https://api.openstreetmap.org/api/0.6/notes?';

  static const headers = {

 'Content-Type': 'application/json'

  };

 
  Future<APIResponse<String>> createNote(NoteInsert item) {

    return http.post(Uri.parse(API), headers: headers, body: json.encode(item.toJson())).then((http.Response data) {

      print('here');
      print((data.statusCode));
      print(data.body);
      if (data.statusCode == 200) {

        print('-----here---------');
        return APIResponse<String>(data: data.body);
        
      }
      return APIResponse<String>(error: true, errorMessage: 'An error occured');
    })

    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
    
  }
}