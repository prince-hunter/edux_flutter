import 'package:edux_app/ui/personal/widget/product/screens/footerWight.dart';
import 'package:edux_app/ui/personal/widget/product/screens/headerWidget.dart';
import 'package:edux_app/ui/personal/widget/product/screens/productWight.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product(
      {Key key}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child:Column(
          children: <Widget>[
            HeaderWidget(),
            ProductWidget(),
            FooterWidget()
          ],
        )),
      ),
    );
  }
}
