import 'package:dio/dio.dart';
import 'package:edux_app/dioHelper/dio_helper.dart';
import 'package:edux_app/tool/errorPrint/errorPrint.dart';
import 'package:edux_app/ui/BottomNavigation.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:edux_app/tool/sharedPreferences/sharedPreferences.dart';

class LoginBtn extends StatefulWidget {
  @override
  _LoginBtnState createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  String resCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initFluwx();
    fluwx.weChatResponseEventHandler.distinct((a, b) => a == b).listen((res) {
      if (res is fluwx.WeChatAuthResponse) {
        setState(() {
          resCode = res.code;
        });
        if (res.errCode == 0) {
          loginServer();
        } else {
          errorPrint("未知的错误发生,请联系管理员......");
        }
      }
    });
  }

  loginServer() async {
    logger.d("阿拉啦啦啦啦啦");
    Dio dio = DioHelper().dio;
    Response response = await dio.post("/wxlogin", data: {"code": resCode});
    logger.d(response);
    if (response.data["nickname"] != null) {
      await setUserInfo(
          response.data["nickname"],
          response.data["unionid"],
          response.data["headimgurl"],
          response.data["Token"],
          response.data["deadline"],
          response.data["password"]);
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(builder: (context) => BottomNavigation()),
          (route) => route == null);
    }
  }

  _initFluwx() async {
    await fluwx.registerWxApi(
      appId: "wxe43f120852491d33",
      doOnAndroid: true,
      doOnIOS: true,
      // universalLink: "ios 需要"
    );
    var _result = await fluwx.isWeChatInstalled;
    logger.i("is installed $_result");
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double tpx = MediaQuery.of(context).size.height / 750;
    return Container(
        height: 40 * tpx,
        width: 600 * rpx,
        margin: EdgeInsets.all(75 * rpx),
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            color: Colors.teal,
            splashColor: Colors.white,
            textColor: Colors.white,
            child: Text(
              "微信登录",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35 * rpx,
                  letterSpacing: 10 * rpx),
            ),
            onPressed: () {
              fluwx
                  .sendWeChatAuth(
                      scope: "snsapi_userinfo", state: 'wechat_sdk_demo_test')
                  .then((value) {
                logger.i("这是微信登录....$value");
              });
            }));
  }
}
