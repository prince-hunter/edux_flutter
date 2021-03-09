import 'package:date_format/date_format.dart';
import 'package:edux_app/api/pay.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/model/pay/pay_history_item.dart';
import 'package:edux_app/tool/loadingDots/loadingDots.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/material.dart';

//购买记录
class PayHistory extends StatefulWidget {
  const PayHistory({Key key})
      : super(key: key);
  @override
  _PayHistoryState createState() => _PayHistoryState();
}

class _PayHistoryState extends State<PayHistory> {
  List<PayHistoryItem> newsList;

  @override
  void initState() {
    super.initState();
    getPayHistoryList();
  }

  getPayHistoryList() async {
    var resp = await getPayHistory(User.userUnionid,User.userToken);
    logger.i(resp.err);
    logger.i(resp);
    setState(() {
      newsList = resp.pay_history_ip_product_list;
    });
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      appBar: AppBar(
        title: Text("购买记录"),
        backgroundColor: Colors.teal[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: newsList == null
              ? LoadingDots()
              : Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(vertical: 20 * rpx),
                  child: ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        return HistoryCard(item: newsList[index]);
                      }),
                )),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key key, this.item}) : super(key: key);
  final PayHistoryItem item;

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    logger.i("item:$item");
    return Card(
      child: Column(
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                color: Colors.orangeAccent,
//   shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.only(
//     topRight: Radius.circular(20.0),
//     topLeft: Radius.zero,
//     bottomRight: Radius.zero,
//     bottomLeft: Radius.circular(20.0))),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.brown,
                      size: 20 * rpx,
                    ),
                    Text(
                      "生效中",
                      style: TextStyle(
                          fontSize: 20 * rpx,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.product_name,
                  style: TextStyle(
                      fontSize: 30 * rpx, fontWeight: FontWeight.bold),
                ),
                Text("实付 ￥${(item.price / 100).toString()}",
                    style: TextStyle(
                        fontSize: 30 * rpx, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
              child: Row(
                children: [
                  Text(
                    "有效期：${formatDate(DateTime.parse(item.valid_start_date), [
                      yyyy,
                      '年',
                      mm,
                      '月',
                      dd
                    ])}-${formatDate(DateTime.parse(item.valid_stop_date), [
                      yyyy,
                      '年',
                      mm,
                      '月',
                      dd
                    ])}",
                    style: TextStyle(
                        fontSize: 20 * rpx, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${formatDate(DateTime.parse(item.pay_date), [
                    yyyy,
                    '年',
                    mm,
                    '月',
                    dd
                  ])}支付成功",
                  style: TextStyle(
                      fontSize: 20 * rpx,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "一旦生效无法退款",
                  style: TextStyle(
                      fontSize: 20 * rpx,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class TextLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "${formatDate(DateTime.parse(User.deadline), [yyyy,'-',mm,'-',dd,' ',hh,':',nn,':',ss])}",
        style: TextStyle(),textAlign: TextAlign.right,
      ),
    );
  }
}
