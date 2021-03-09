import 'dart:convert';

import 'package:edux_app/model/product/ip_product_item.dart';
import 'package:edux_app/ui/personal/widget/product/colorScreens/colorScreens.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final IpProductItem productModel;
  final Function onTap;
  final int index;

  const ProductItem({Key key, this.productModel, this.onTap,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 280,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20,
              child: Text(productModel.product_name, style: ThemeStyle.productTitle),
            ),
            SizedBox(height: 20),
            Container(
              height: 380,
              decoration: BoxDecoration(
                  color: ThemeColor.secondaryColor,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Hero(
                tag: "img$index}",
                child: Container(
                  padding: EdgeInsets.all(40),
                  child: Image.memory(
                    base64Decode(productModel.avatar_big.split(",")[1]),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}