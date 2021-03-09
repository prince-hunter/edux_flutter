import 'package:edux_app/api/product.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/model/product/ip_product_item.dart';
import 'package:edux_app/ui/personal/widget/product/colorScreens/colorScreens.dart';
import 'package:edux_app/ui/personal/widget/product/screens/productDetail.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/material.dart';

import 'itemWidget.dart';

class ProductWidget extends StatefulWidget {
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<IpProductItem> productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }

  getProductList() async {
    var resp = await getIPProductReq(User.userUnionid, User.userToken);
    setState(() {
      productList = resp.ip_product_list;
      logger.d(productList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? CircularProgressIndicator()
        : Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("产品详情:", style: ThemeStyle.productInfo),
              ),
              SizedBox(height: 20),
              Container(
                height: 480,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ProductItem(
                        productModel: productList[index],
                        index: index,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ProductDetail(
                                  productModel: productList[index],
                                  index: index)));
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ));
  }
}
