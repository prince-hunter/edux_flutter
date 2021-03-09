import 'package:edux_app/conf/config.dart';
import 'package:flutter/material.dart';

class LMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.perm_identity, size: 64),
                  title: Text("irocn"),
                  subtitle: Text("irocn@irocn.com"),
                ),
                ListTile(leading: Icon(Icons.login), title: Text("login")),
                ListTile(leading: Icon(Icons.qr_code), title: Text("Scran QR")),
                ListTile(leading: Icon(Icons.help_center_outlined), title: Text("Help")),
                ListTile(leading: Icon(Icons.adjust_rounded), title: Text(Config().version)),
              ],
    ));
  }
}