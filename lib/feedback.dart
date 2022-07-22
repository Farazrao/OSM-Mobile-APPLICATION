// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//Here i call the page map.dart
import 'package:prototype_application_1/map.dart';
import 'dart:math';
//Here i call the page noteService.dart
import 'package:prototype_application_1/NoteService.dart';
import 'package:get_it/get_it.dart';
//Here i call the page note.dart 
import 'package:prototype_application_1/note.dart';

class feedback extends StatefulWidget {
  String lat,lon;
  feedback({required this.lat,required this.lon});


 
  @override
  _feedbackState createState() => _feedbackState(lat,lon);
}

class _feedbackState extends State<feedback> {

  // Here i connect the page which is Noteservice.dart because when the user enter the note it goes to the Noteservice.dart.

  NotesService get noteService => GetIt.I<NotesService>();
  bool _isLoading = false;

  // ignore: prefer_final_fields
  TextEditingController _noteCon = TextEditingController();
  
  String lat,lon;
  _feedbackState(this.lat,this.lon);

  
 

  
  final _formKey = GlobalKey<FormBuilderState>();

  get padding => null;

  // In the feedback page I also create the UI part of the project which is starting from here
  //Ui consists of multiple parts which are Checkboxes, Textfield, Text, Button and when the user clicks on the button popup will be created on the screen

  List<Map> availableHobbies = [
    {"name": "Fehlendes oder fehlerhaftes Objekt", "isChecked": false ,"value":"Hier fehlt ein Objekt auf der Karte."},
    {"name": "Gefahrenstelle", "isChecked": false,"value":"Hier befindet sich eine mögliche Gefahrenstelle."},
    {
      "name": "Andere",
      "isChecked": false,
    },
    
  ];
  String checkbox='';
  String value='';
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
     
    body: Center(
      
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        
        children:<Widget> [ 

        //Give padding to the different sentences,

          const Padding (
          padding :  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child:Text('Sie wollen an Ihrer aktuellen Position eine Anmerkung vornehmen',  style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Colors.black),),
         
        ),
        
          const Padding (
          padding :  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Text('Bitte wählen Sie eine Kategorie aus:                                                                        ',  style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Colors.black),),
         
        ),   
            // Here we Align checkboxes,
                    Column(
                children: availableHobbies.map((hobby) {
              return CheckboxListTile(
                  value: hobby["isChecked"],
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(hobby["name"]),
                  // value: hobby["isChecked"],
                  onChanged: (newValue) {
                    setState(() {
                      hobby["isChecked"] = newValue;
                      checkbox=hobby["name"];
                      value=hobby["value"];

                    });
                  });
                  
            }).toList()),
           

          
          const Text('Weitere Informationen zur Anmerkung:', style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Colors.black,),),
          
          Padding (
          padding :  EdgeInsets.symmetric(horizontal: 8, vertical: 10),

          //This is the textfeild for the User So, can enter the note here easily,
          
          child: TextField(           
            controller: _noteCon,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              
            ),
          ),
        ),
        const Padding (
          padding :  EdgeInsets.symmetric(vertical: 2),
          child: Text('Im Textfeld kann eine Beschreibung hinzugefügt werden', style: TextStyle(fontSize: 15.0 ,color: Colors.black),),
         
        ),
            
             const Padding (
          padding :  EdgeInsets.symmetric(horizontal: 8, vertical: 10),
         
        ),

         //This is The Button to sumbit the note in OSM 

          ElevatedButton
          (
            onPressed: () async{
            final fnote=value+" "+_noteCon.text;
            final note = NoteInsert(lat: lat ,lon: lon, note: fnote);
             final result = await noteService.createNote(note);
             final title='Created';

             //confirmation of the Alertdialog box,

             print(checkbox);
             final text =( result.data).toString(); 
            var showDialog2 = showDialog(context:context,builder: (BuildContext context){
            return const AlertDialog(
              title: Text('Vielen Dank!'),
              content: Text('Ihre Anmerkung wurde an OSM Notes gesendet.                                                               Die OpenStreetMap Community wird Ihr Feedback zur Karte sichten. '),
            );
          });
            
            },
            
            //Here i give the name of the button 
            
            child: 
            const Text('ABSENDEN' ,style: TextStyle(
                      color:const Color(0xffF9F9F9)),
           ),

           //Here i give the style to ElevatedButton

           style: ElevatedButton.styleFrom(
             fixedSize: const Size(136,48),
             primary: const Color(0xff2A2A98)
             
             
           )
          )
          ],
      ),
      
    ),  
    );
  }
}




