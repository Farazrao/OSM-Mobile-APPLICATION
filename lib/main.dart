import 'package:flutter/material.dart';
import 'package:prototype_application_1/secondscreen.dart';
import 'package:get_it/get_it.dart';
import 'package:prototype_application_1/NoteService.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesService());
}
 //Here you can see the main void funtion of main.dart file,
void main() {
   setupLocator();
  runApp(const MaterialApp(
    title: "MyApp",
    home: MyDrawer(),
  ));
}
 //Create the StatefuWidget
 
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyDrawerState();
  }
  //Here extend the StatefuWidget
}
class _MyDrawerState extends State<MyDrawer> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OSM Map Demo"),       
      ),
      //This the Body of main.dart file
     body: Center(
        child: RaisedButton(
          child: const Text("Go to OSM"),
          color: Colors.blue,
          
          //Navigate route plan,
          //Here I create the on pressed fiction, when the user click on the button you can see on the first page which is GO TO OSM then it 
          //directly goes to the second screen.

          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => secondscreen()));
          },
        ),
      ),
    );
  }
}

