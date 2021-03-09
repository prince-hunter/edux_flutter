import 'package:edux_app/conf/config.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/tool/sharedPreferences/sharedPreferences.dart';
import 'package:edux_app/ui/HomeScreen.dart';
import 'package:edux_app/ui/login/wechatLogin/LoginScreen.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'personal/Personal.dart';
import 'cloud/CloudX.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> _list = List();
  int _currentIndex = 0;

  @override
  Future<void> initState() {
    _list.clear();
    _list
      ..add(Config.is_gx_version
          ? Text("tunnel feature is moved to the personal screen")
          : HomeScreen()) //GX version
      ..add(Config.is_gx_version
          ? Text("tunnel feature is moved to the personal screen")
          : CloudX())
      ..add(User.is_logined
          ? Personal()
          : LoginScreen()); //if logined load personal profil screen or load login screen
    getUserInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo  drawer: LMenu(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        selectedFontSize: 12,
        elevation: 20,
        selectedItemColor: Colors.red,
        unselectedItemColor: Color(0xff606060),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
          _list.clear();
          _list
            ..add(Config.is_gx_version
                ? Text("tunnel feature is moved to the personal screen")
                : HomeScreen()) //GX version
            ..add(Config.is_gx_version
                ? Text("tunnel feature is moved to the personal screen")
                : CloudX())
            ..add(User.username != null
                ? Personal()
                : LoginScreen()); //if logined load personal profil screen or load login screen
        },
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: 'Cloud', icon: Icon(Icons.cloud_queue_outlined)),
          BottomNavigationBarItem(
              label: 'Personal', icon: Icon(Icons.person_outline))
        ],
      ),
      body: _list[_currentIndex],
    );
  }
}
