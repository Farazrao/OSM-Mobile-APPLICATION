import 'package:flutter/material.dart';
import 'package:prototype_application_1/OSMDart.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

//Create the List class with StatefulWidget,

class list extends StatefulWidget {
  const list({ Key? key }) : super(key: key);

  @override
  _listState createState() => _listState();
}
 
  //List of OSM just like user,textfeild,longitude,latitude,

class _listState extends State<list> {
  List<OSMData> itemsList = [];
  late String user;
  late String text;
    late String lat;
    late String lon;

  @override

  // void init satet for setstate,

  void initState() {
    setState(() {
      parsing();
    });
    super.initState();
  }
   //Here we parse xml dataset,
   
  parsing() async {
    
    final response = await http.get(Uri.https('api.openstreetmap.org',
        '/api/0.6/notes', {"bbox": "50.80,12.8,50.9,12.99"}));
    var document = xml.XmlDocument.parse(response.body);
    
    Iterable<xml.XmlElement> comment = document.findAllElements('comment');
    //--------------------------------------------------------------------------
    
    Iterable<xml.XmlElement> note = document.findAllElements('note');
    note.map((xml.XmlElement x) {
      print('heree------------');
      lat=x.getAttribute('lat').toString();
      lon=x.getAttribute('lon').toString();
         Iterable<xml.XmlElement> comms = x.findElements('comments');
            comms.map((xml.XmlElement y) {
              print('2 heree------------');
              Iterable<xml.XmlElement> comm = y.findElements('comment');
                comm.map((xml.XmlElement z) {
                print('2 heree------------');
                if (getValue(z.findElements("user")) == null || getValue(z.findElements("user")) == ''){
                  user= 'No user found';
                  
                }else
                {
                  user=getValue(z.findElements("user"));
                }
                if (getValue(z.findElements("text"))== null|| getValue(z.findElements("text"))== ''){
                  text= 'No text found';
                }else
                {
                  text=getValue(z.findElements("text"));
                }
                      
              }).toList();
            
            }).toList();
          print(lat + lon + user + text);
          itemsList.add(OSMData(user,text,lat,lon));  
         
        }).toList();
        setState(() {
         
       }); 
       //print(test);
    
//--------------------------------------------------------------------------
    
  }

  getValue(Iterable<xml.XmlElement> items) {
    var textValue;
    items.map((xml.XmlElement node) {
      textValue = node.text;
    }).toList();
    return textValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("OSM Data"),
      ),
      body: itemsList.length > 0
          ? ListView(
              children: itemsList.map((OSMData item) {
              return ListTile(
                subtitle: Text('Note: ' + item.text ),
                
                
                title: Text('User: ' + item.user+ '  Latitude: ' + item.lat +'  '+ '  Longitude: '+item.lon),
              );
            }).toList())
          : Center(
              
            ),
    );
  }
}