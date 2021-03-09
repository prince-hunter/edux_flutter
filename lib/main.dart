import 'package:edux_app/ui/BottomNavigation.dart';

import 'ui/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'conf/config.dart';


void main() {
  runApp(MaterialApp(
    /* i18n support todo
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('cn', 'CN'), // Chinese
      ],
    */
      title:Config().title,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: BottomNavigation()
  ));
}
