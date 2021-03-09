

import 'package:flutter/material.dart';

Widget generateAppBar(){
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.grey),
    title: Image.asset(
      'assets/images/edux_logo.png',
      width: 98.0,
      height: 22.0,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.videocam),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {},
      ),
    ],
  );
}
