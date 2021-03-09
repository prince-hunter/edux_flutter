import 'dart:convert';

import 'package:edux_app/model/product/ip_product_item.dart';
import 'package:edux_app/ui/personal/widget/product/colorScreens/colorScreens.dart';
import 'package:flutter/material.dart';

import 'CustomsBtn.dart';
import 'largeButton.dart';
class ProductDetail extends StatefulWidget {

  final IpProductItem productModel;
  final int index;

  const ProductDetail({Key key, this.productModel,this.index}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomsBtn(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    color: ThemeColor.secondaryColor,
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  CustomsBtn(
                    icon: Icon(Icons.favorite, color: ThemeColor.accentColor),
                    color: ThemeColor.secondaryColor,
                  )
                ],
              ),
            ),

            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "img${widget.index}",
                        child: Image.memory(
                          base64Decode(widget.productModel.avatar_big.split(",")[1]),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),

                  // widget.productModel.isBatery ?  Positioned(
                  //   left: 20,
                  //   top: 1,
                  //   child: Container(
                  //     width: 80,
                  //     height: 40,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: ThemeColor.secondaryColor
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text("Batery", style: TextStyle(color: ThemeColor.fontColor)),
                  //         Text("30h", style: TextStyle(color: Colors.white))
                  //       ],
                  //     ),
                  //   ),
                  // ) : Container()
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                    color: ThemeColor.secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.productModel.product_name, style: ThemeStyle.productDetailTitle),
                    SizedBox(height: 12),
                    Text("\￥${(widget.productModel.price/100).toString()}",style: ThemeStyle.productDetailPrice),
                    SizedBox(height: 12),
                    Text(widget.productModel.description, style: ThemeStyle.productDetailDescription),
                    SizedBox(height: 40),
                    LargeButton(
                        title: "立即购买",
                        price:"${(widget.productModel.price/100).toString()}",
                        goodsId:widget.productModel.product_id
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
