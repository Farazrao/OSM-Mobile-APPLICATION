import 'dart:async';

import 'package:demo_project_2/note.dart';
import 'package:flutter/material.dart';
import 'package:demo_project_2/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'dart:convert';
import 'package:demo_project_2/NoteService.dart';


class PostNote extends StatefulWidget {
  const PostNote({ Key? key }) : super(key: key);

  @override
  _PostNoteState createState() => _PostNoteState();
}

class _PostNoteState extends State<PostNote> {


  bool _isLoading = false;
  NotesService get noteService => GetIt.I<NotesService>();
  TextEditingController latCon = TextEditingController();
  TextEditingController lonCon = TextEditingController();
  TextEditingController noteCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          TextField(
            controller: lonCon,
            decoration: InputDecoration(
              hintText: 'Longitude'
            ),
          ),
          TextField(
            controller: latCon,
            decoration: InputDecoration(
              hintText: 'Latitude'
            ),
          ),
          TextField(
            controller: noteCon,
            decoration: InputDecoration(
              hintText: 'Add note'
            ),
          ),
          ElevatedButton(
            onPressed: () async{
             final note = NoteInsert(lat: latCon.text ,lon: lonCon.text, note: noteCon.text);
             final result = await noteService.createNote(note);
             final title='Created';
             print(result);
             final text =( result.data).toString();

             showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: SingleChildScrollView(
                          child:Text(text)),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              
                            },
                          )
                        ],
                      )
                    );
            },
           child: Text('Submit'))
        ],
      ),
    ),  
    );
  }
}