import 'package:dio/dio.dart';
import 'package:edux_app/dioHelper/dio_helper.dart';
import 'package:edux_app/model/User.dart';
import 'package:edux_app/tool/sharedPreferences/sharedPreferences.dart';
import 'package:edux_app/ui/BottomNavigation.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class PayPage extends StatefulWidget {
  const PayPage({Key key, @required this.price, @required this.goodsId})
      : super(key: key);
  final String price;
  final String goodsId;

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  bool checked = false;
  var result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initFluwx();
    fluwx.weChatResponseEventHandler.listen((res) {
      if (res is fluwx.WeChatPaymentResponse) {
        logger.i(
            "===========${res.errCode}=========${res.errStr}======${res.isSuccessful}=======");
        setState(() {
          result = "pay :${res.isSuccessful}";
          refreshDeadLine();
        });
      }
    });
  }

  refreshDeadLine() async {
    Dio dio = DioHelper().dio;
    Response response = await dio.post("/refreshDeadLine", data: {"unionID": User.userUnionid});
    logger.d(response);
    await setUserInfo(
        response.data["wx_nickname"],
        response.data["wx_unionid"],
        response.data["wx_headimgurl"],
        response.data["pltf_token"],
        response.data["deadline"],
        response.data["password"]);
    await getUserInfo();
    Navigator.pushAndRemoveUntil(
        context,
        new MaterialPageRoute(builder: (context) =>BottomNavigation()),
            (route) => route == null);
  }

  _initFluwx() async {
    await fluwx.registerWxApi(appId: "wxe43f120852491d33");
    var _result = await fluwx.isWeChatInstalled;
    logger.i("is installed $_result");
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      appBar: AppBar(
        title: Text("收银台"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20 * rpx),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  checked = !checked;
                  if (checked == true) {
                    User()
                        .payAction(
                            User.userUnionid, User.userToken, widget.goodsId)
                        .then((data) {
                      logger.i("data:$data");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              content: Text("是否确定要支付￥${widget.price}元？"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("是"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    fluwx
                                        .payWithWeChat(
                                      appId: data.app_id,
                                      partnerId: data.partner_id,
                                      prepayId: data.prepay_id,
                                      packageValue: data.package,
                                      nonceStr: data.nonce_str,
                                      timeStamp: data.time_stamp,
                                      sign: data.sign,
                                    )
                                        .then((data) {
                                      logger.i("---》$data");
                                    });
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("否"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    });
                  }
                });
              },
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 20 * rpx),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250 * rpx,
                      child: Image.asset(
                        "assets/images/WePayLogo.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      width: 100 * rpx,
                      child: Image.asset("assets/images/advice.png"),
                    ),
                    Container(
                      child: IconButton(
                        icon: checked == false
                            ? Icon(
                                Icons.check_circle,
                                size: 50 * rpx,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.check_circle,
                                size: 50 * rpx,
                                color: Colors.green,
                              ),
                        onPressed: () {
                          setState(() {
                            checked = !checked;
                            if (checked == true) {
                              User()
                                  .payAction(User.userUnionid, User.userToken,
                                      widget.goodsId)
                                  .then((data) {
                                logger.i("data:$data");
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        content:
                                            Text("是否确定要支付￥${widget.price}元？"),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: Text("是"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              fluwx
                                                  .payWithWeChat(
                                                appId: data.app_id,
                                                partnerId: data.partner_id,
                                                prepayId: data.prepay_id,
                                                packageValue: data.package,
                                                nonceStr: data.nonce_str,
                                                timeStamp: data.time_stamp,
                                                sign: data.sign,
                                              )
                                                  .then((data) {
                                                logger.i("---》$data");
                                              });
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            child: Text("否"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
                              });
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
