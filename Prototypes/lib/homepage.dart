
import 'package:demo_project_2/OSMDart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<OSMData> itemsList = [];
  late String user;
  late String text;
    late String lat;
    late String lon;

  @override
  void initState() {
    setState(() {
      parsing();
    });
    super.initState();
  }

  parsing() async {
    
    final response = await http.get(Uri.https('api.openstreetmap.org',
        '/api/0.6/notes', {"bbox": "-0.65094,51.312159,0.374908,51.669148"}));
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
