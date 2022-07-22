import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  const SecondScreen ({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Center(child: RaisedButton(child: const Text("Go Back"),color: Colors.blue,
      onPressed: (){
        Navigator.pop(context);
      },),),
      
    );
  }
}