import 'package:edux_app/ui/personal/widget/product/colorScreens/colorScreens.dart';
import 'package:flutter/material.dart';

import 'CustomsBtn.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          item(Icons.account_circle_sharp, "客服热线"),
          item(Icons.star, "评价"),
        ],
      ),
    );
  }

  Widget item(IconData iconData, String title){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomsBtn(
          color: ThemeColor.secondaryColor,
          icon: Icon(iconData, color: Colors.white),
        ),
        SizedBox(width: 10),
        Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(title, style: ThemeStyle.footerTile),
        )
      ],
    );
  }
}

