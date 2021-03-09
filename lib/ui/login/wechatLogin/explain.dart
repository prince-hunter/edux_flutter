import 'package:flutter/material.dart';

class Explain extends StatefulWidget {
  @override
  _ExplainState createState() => _ExplainState();
}

class _ExplainState extends State<Explain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              "1秒登录Edux体验服务",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 5),
            Text(
              "微信登录和其他账号登录是两个独立账号，账号信息不互通",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
