// ignore_for_file: deprecated_member_use


import 'package:demo_project_2/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:demo_project_2/homepage.dart';
import 'package:demo_project_2/settingpage.dart';
import 'package:demo_project_2/logoutpage.dart';
import 'package:demo_project_2/API.dart';

void main(){
  runApp(
    const MaterialApp(
      title: "MyApp",
      home: MyDrawer(),
    )
  );
}
class MyDrawer extends StatefulWidget{
  const MyDrawer({Key? key}) : super(key: key);
  

  @override
  State<StatefulWidget> createState() {
    return _MyDrawerState();
  }

}
class _MyDrawerState extends State<MyDrawer>{
   int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text("My App"),),
      
      drawer: Drawer(
        child:Column(children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
            width: 78,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage("https://lh3.googleusercontent.com/a-/AOh14GjM0tRTvlXHUPdjZuXQxzENKlxc5JZcq65KgcZSVg=s83")
              )
            ),
          ),
          const Text(
            "Rao Faraz Shakeel",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              ),
              )
            ],
            ),
          ),
          ListTile(
            title: const Text("Home", style: TextStyle(fontSize: 17),),
            leading: const  Icon(Icons.home),
             onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
            },
          ),
          ListTile(
            title: const Text("setting", style: TextStyle(fontSize: 17),),
            leading: const Icon(Icons.settings),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
            },
          ),
           ListTile(
            title: const Text("API", style: TextStyle(fontSize: 17),),
            leading: const Icon(Icons.celebration),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>API()));
            },
          ),
          ListTile(
            title: const Text("Logout", style: TextStyle(fontSize: 17),),
            leading: const Icon(Icons.logout),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogoutPage()));
            },
          ),
        ],),
      ),
      body:Center(
    child:RaisedButton(child:const Text("Go to Second Screen"),
    color:Colors.blue,
    onPressed:(){
     Navigator.push(context,MaterialPageRoute(builder:(context)=> const SecondScreen()));
      },

     ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem> [
          const BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          const BottomNavigationBarItem(icon: Icon(Icons.info),label: "About"),
          const BottomNavigationBarItem(icon: Icon(Icons.cleaning_services),label: "Services"),
        ],
        currentIndex: _selectedItem,
        onTap: (setvalue){
          setState(() {
            _selectedItem = setvalue;
          });
        },
      ),
    );
  }
}

API() {
}
