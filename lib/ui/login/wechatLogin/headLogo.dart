import 'package:flutter/material.dart';

class HeadLogo extends StatefulWidget {
  @override
  _HeadLogoState createState() => _HeadLogoState();
}

class _HeadLogoState extends State<HeadLogo> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double tpx = MediaQuery.of(context).size.height / 750;
    return Container(
      height: 120 * tpx,
      child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.grey[400],
              radius: 50,
              backgroundImage: AssetImage("assets/images/person.png"))
      ),
    );
  }
}
