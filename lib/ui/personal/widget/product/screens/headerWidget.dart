import 'package:edux_app/ui/personal/widget/product/colorScreens/colorScreens.dart';
import 'package:flutter/material.dart';
import 'CustomsBtn.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(color: Color(0xFFF1f94aa).withOpacity(0.5), blurRadius: 5)
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon:Icon(Icons.arrow_back_ios,color: Color(0xFFF1f94aa)), onPressed: (){
              Navigator.pop(context,true);
            }),
            Text("IROCN科技产品", style: ThemeStyle.homeTitle),
            CustomsBtn(
              color: ThemeColor.secondaryColor,
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              isNotify: true,
            )
          ],
        ),
      ),
    );
  }
}