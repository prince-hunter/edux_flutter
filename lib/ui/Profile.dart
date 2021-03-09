import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    //Get device screen size
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(width.toString()),
          Text(height.toString())
        ],
      ),
    );
  }
}
