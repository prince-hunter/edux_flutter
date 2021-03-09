import 'package:edux_app/ui/personal/widget/product/colorScreens/colorScreens.dart';
import 'package:edux_app/ui/personal/widget/product/screens/payPage.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {

  final String title;
  final Function onTap;
  final String goodsId;
  final String price;

  const LargeButton({Key key, this.title, this.onTap,this.goodsId,this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PayPage(goodsId: goodsId,price: price,)));
      },
      child: Container(
        height: 40,
        width: 160,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ThemeColor.accentColor,
            borderRadius: BorderRadius.circular(18)
        ),
        child: Text(title, style: ThemeStyle.productLargeButton),
      ),
    );
  }
}