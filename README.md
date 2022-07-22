# OSM project
## structure Overview

This project consists of 4 pages.

## main.dart
## secondscreen.dart for UI also
## map.dart
## note.dart
## noteService.dart
## Api_response.dart
## Feedback.dart for UI

 So, These all file are working together 
 I create these files but in Feedback.dart and Secondscreen.dart file consist the UI part of the project 
 Similarly the other files work as a backend.

## working of this project
In this project user can see the the first page
in first page there is a button which is called GO TO OSM 
when the user click on this buttoon the new page will be open which is Secondscreen
In secondscreen.dart file the user can see the OSM map after this when the user click on the Map
and select the location, after selecting the location the new page open which is Feedback.dart file.
Feedback.dart consist of UI also so the user enter the required data in this page because its a form page.
Then user click on submit button and the noet and all the data which is enter by user its directlz publised on the 
selecetd location .
Behind this feedback.dart page there are multiple work done by back file so 
we have these backend files give bellow.
## map.dart
## note.dart
## noteservice.dart
## Api_response.dart
 these files are calling by different areas 
 link when the user click on first page button GO TO OSM
 THEN in this part the file 
 ## map.dart is called and show the OSM map on the secondscreen in frontend
  after this when the user select the location and new page will be open as you know the name which is feedback.dart
  so in this feedback.dart page calls the othes files of backend  for publised the note on the exact location which is 
  selected by the user publically.



///////
## IMPLEMENTATION PART OF THE ODM PROJECT 
/////



## pages
Here i upload the pages with the comments also.

## main.dart file:

In this page i import the packages and the go for void main fnction.
then create the widget of _MyDrawer and extend this widget in next line.
Then main part of this page is body where you an see the Button GO TO OSM in the imlator or in frontend.

    body: Center(
    child: RaisedButton(
    child: const Text("Go to OSM"),
    color: Colors.blue,
          
Navigate route plan,
Here I create the on pressed fiction, when the user click on the button you can see on the first page which is GO TO OSM then it 
directly goes to the second screen.

    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => secondscreen()));
    },
    ),
    ),

## secondscreen.dart 
This is the second page of the project in which 
i alo add the navigation bar for the UI in frontend view.
    bottomNavigationBar:BottomNavigationBar(
    onTap: onTappedBar,
    currentIndex: _currentIndex,

Three diferent icons of the three different pages shows on the bottomNavigation Bar,
first item called list show in bottomNavigation Bar,

    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'list',
    backgroundColor: Colors.red,
            
    ),

    Second item called Map show in bottomNavigation Bar,
          
    BottomNavigationBarItem(
    icon: Icon(Icons.map_outlined),
    label: 'Map',
    backgroundColor: Colors.green,
    ),

    Third item called Feedback show in bottomNavigation Bar,

    BottomNavigationBarItem(
            
    icon: Icon(Icons.feedback),
    label: 'feedback',
    backgroundColor: Colors.purple,
    ),
    ],
         
    ) ,
After this i also set the list of map and the current location.
 
First i call list the map the feedback:

    list(),
    map(),
    feedback(lat:"50.827847",lon:"12.921370"),

Set the current location in osm:

    LatLng point = LatLng(50.827847, 12.921370);
    late String address;
    int level=0;
  After this i call the next page which is map.dart so by this in frontview i show the OSM ap in second screen.
  i used the import function as you know when we call the other pages in flutter we can go for import the page just like:

    import 'package:flutter_map/flutter_map.dart';

  and also i call the UI part whioch consist the name Feedback.dart file by this:

    import 'package:prototype_application_1/feedback.dart';

## map.dart file
In this file i set the map and connect to the second screen by using the import function.
so this page consist the OsM MAP AND DIRECTLZ LINK WITH  secondscreen.dart file.
after this i call the third page which is note.dart file 
In the part you can see that I call the Noteinsert means note. dart file when the user enters the note and clicks on submit
 button directly saves to the exact location that the user can select earlier.

    final data=NoteInsert(lat: p.latitude.toString(),lon: p.longitude.toString(),note: "");
    Navigator.of(context).push(MaterialPageRoute(

 Here you can see that when the user clicks on the map and selects the location it directly goes to the feed. dart page which consists of UI 

    builder: (context)=>feedback(lat:lat,lon:lon)));
    });

## note.dart file

In this page i set the langitde an longitde for the user which means when the user select the location and type the 
Note about the location it directly upload the selected location by the user side.
latitude, longitude, and the text field for creating the user note in flutter and show on  OSM,I just map the data in json form

    Map<String, dynamic> toJson() {
        return {
        "lat": lat,
        "lon": lon,
        "text":note
        };
    }
    }
## Noteservice.dart file
In this page i call the two different pages of backend one is 
Note.dart
and second is 
Api_response.dart file
Actualy in the noteservice i set the link of OSM map where the note will be publised.
and give the api responese which means i used the ifsatement so the note is publised then its fine otherwise we 
received the error message here is the complete comments of the code:
    class NotesService {

Set the link of OSM,
THIS IS THE DUMMY SERVER OF osm https://master.apis.dev.openstreetmap.org/api/0.6/notes?

    static const API = 'https://master.apis.dev.openstreetmap.org/api/0.6/notes?';

    static const headers = {

    'Content-Type': 'application/json'

    };

when the user enters the note it comes to Note service and in note service. dart connected with a note.dart file to save the user note to the 
exact selected location in osm 

    Future<APIResponse<String>> createNote(NoteInsert item) {

    return http.post(Uri.parse(API), headers: headers, body: json.encode(item.toJson())).then((http.Response data) {

    print('here');
    print((data.statusCode));
    print(data.body);
       
Here i used the if/else statement if the response is received then its store otherwise the erorr will be shown on the screen

    if (data.statusCode == 200) {

    print('-----here---------');
    return APIResponse<String>(data: data.body);
        
    }
    return APIResponse<String>(error: true, errorMessage: 'An error occured');
    })

    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
    
    }
    }
## Api_response.dart file
In this file which is call by Noteservice.dart file i just set the response.
so:

Here i create the class name Apiresponse just it response the data, error, erorr message

    class APIResponse<T> {
    T? data;
    bool? error;
    String? errorMessage;

    APIResponse( { this.data,  this.errorMessage,this.error=false});
    }
## Feedback.dart file
In this pages i connect the different pages you can see below:

Here i call the page map.dart.

    import 'package:prototype_application_1/map.dart';

Here i call the page noteService.dart

    import 'package:prototype_application_1/NoteService.dart';

Here i call the page note.dart

    import 'package:prototype_application_1/note.dart';

THis page consist ui PART OF THIS PROJECT 
Ui consists of multiple parts which are Checkboxes, Textfield, Text, Button and when the user clicks on the button popup will be created on the screen

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
In this page i create the text feild 
This is the textfeild for the User So, can enter the note here easily,
          
    child: TextField(           
    controller: _noteCon,
    decoration: const InputDecoration(
    border: OutlineInputBorder(),
              
    ),
    ),
Alos i used paddings,margins for multiple text.

