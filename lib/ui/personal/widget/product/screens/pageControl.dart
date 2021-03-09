import 'package:edux_app/ui/personal/widget/product/screens/payPage.dart';
import 'package:edux_app/tool/provider/btnProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayControl extends StatefulWidget {
  const PayControl(
      {Key key, @required this.price}) : super(key: key);
  final String price;
  @override
  _PayControlState createState() => _PayControlState();
}

class _PayControlState extends State<PayControl> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PersonalAction())
      ],
      child:PayPage(price:widget.price),
    );
  }
}

