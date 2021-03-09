import 'package:flutter/material.dart';
import 'headLogo.dart';
import 'explain.dart';
import 'LoginBtn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double tpx = MediaQuery.of(context).size.height / 750;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200]
      ),
      padding: EdgeInsets.symmetric(vertical: 200 * tpx),
      child: Column(
        children: [
          HeadLogo(),
          Explain(),
          LoginBtn()
        ],
      ),
    );
  }
}
