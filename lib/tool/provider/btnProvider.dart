import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:edux_app/api/basic.dart';
import 'package:edux_app/api/pay.dart';
import 'package:edux_app/dioHelper/dio_helper.dart';
import 'package:edux_app/model/basic/article.dart';
import 'package:edux_app/model/basic/article_list_item.dart';
import 'package:edux_app/model/pay/pre_order.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

_login(String userName, String password, String token, String userId,
    String endDate, String combo) async {
  logger.i("login action...");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userName', userName);
  await prefs.setString('password', password);
  await prefs.setString('token', token);
  await prefs.setString('userId', userId);
  await prefs.setString('endDate', endDate);
  await prefs.setString('combo', combo);
}

_errorPrint(msg) {
  return Fluttertoast.showToast(
      msg: msg, gravity: ToastGravity.CENTER, textColor: Colors.red[200]);
}

class LoginProvider extends ChangeNotifier {
  String userName;
  String password;
  bool checkResult = true; //检测输入框值的合法性状态
  bool loginResult = true; //登录成功或者失败状态返回
  bool checkOldContext = true; //检测路由销毁的上下文状态
  int second = 0;
  String btnText = "Send SMS";

  var resp;

  loginAction() async {
    if ((userName == "" || userName == null) ||
        (password == "" || password == null)) {
      //输入框不为空校验
      _errorPrint(" Your username or password can not be null!");
      loginResult = false;
      return loginResult;
    } else {
      checkResult = RegExp('^[A-Za-z0-9]').hasMatch(userName);
      if (checkResult == false) {
        //非法字符校验
        _errorPrint("Error Input!");
        loginResult = false;
        return loginResult;
      } else {
        DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
        var device;
        if (Platform.isIOS) {
          IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
          device = iosDeviceInfo;
        } else if (Platform.isAndroid) {
          AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
          device = androidDeviceInfo;
        }
        try {
          resp = await login(userName, password, "device.modle");
        } catch (Exception) {
          logger.e("WRONG");
        }
        logger.i(resp);
        if (resp != null &&
            (resp.err == null || (resp.err != null && resp.err.code == 0))) {
          _login(userName, password, resp.token, resp.user_id, resp.end_date,
              resp.combo);
          // _timeKicker(deviceInfo);
          return true;
        } else {
          if (resp != null && resp.err != null && resp.err.desc != "") {
            _errorPrint(resp.err.desc);
          } else {
            _errorPrint("Login Error!");
          }
          return false;
        }
      }
    }
  }

 String smsSendTimer() {
    Timer _timer;
    if (userName == null || userName == "") {
      _errorPrint("phone number can not be null");
      return "send SMS";
    } else {
      if (second == 0) {
        getCode(userName);
          second = 10;
          if (_timer == null) {
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              if (second < 1) {
                btnText = "Send SMS";
                _timer.cancel();
                _timer = null;
                notifyListeners();
                return "send SMS";
              } else {
                second -= 1;
                logger.i(second);
                btnText = "$second S ";
                notifyListeners();
                return "send SMS";
              }
            });
          }
      }
    }
    return second.toString();
  }

  //
  loginOutAction(context) async {
    //注销
    checkOldContext = false;
    Dio dio = DioHelper().dio;
    Response response = await dio.post("/es/logout", data: {
      "password": password,
      "userPhone": userName,
    });
    if (response.data == false) {
      Fluttertoast.showToast(
          msg: "failed to logout",
          gravity: ToastGravity.CENTER,
          textColor: Colors.red[200]);
    }
    Navigator.pop(context);
  }

// _timeKicker(DeviceInfoPlugin deviceInfo){
//   _login(userName, password);
//   Timer _timer;
//   _timer = Timer.periodic(Duration(milliseconds: 10000), (timer) async { //重复登录校验
//     Dio dios = DioHelper().dio;
//     Response res = await dios.post("/checkSession", data: {
//       "username": userName,
//       "device": deviceInfo
//     });
//     if (res.data["status"] == "000") {
//       _timer.cancel();
//       if(checkOldContext ==true){
//         showDialog(
//           context: OldContext,
//           barrierDismissible: false, // user must tap button!
//           builder: (BuildContext context) {
//             return AlertDialog(
//               // title: Text('我是标题'),
//               content: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Icon(
//                       Icons.warning_amber_outlined,
//                       color: Colors.red[400],
//                     ),
//                   ),
//                   Text(
//                     "Your Account Has Been Logged In",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               actions: <Widget>[
//                 FlatButton(                                               // 强制踢出弹框
//                   child: Text('OK',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold)),
//                   onPressed: () {
//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         new MaterialPageRoute(
//                             builder: (context) => LoginScreen()),
//                             (route) => route == null);
//                   },
//                 ),
//               ],
//               backgroundColor: Colors.grey[800],
//               elevation: 20,
//               semanticLabel: '',
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//             );
//           },
//         );
//       }
//     }
//   });
// }
}

class NewsProvider extends ChangeNotifier {
  List<ArticleListItem> newsList;
  ArticleResp articleResp;

  thumbUpOrDown(String type, int index, String userId, String token) async {
    if (type == "1") {
      var resp = await thumbUp(
          userId, newsList[index].article_id, token, !newsList[index].thumb_up);
      logger.i("up+ $resp ");
      newsList[index].thumb_up_count = resp.count;
      newsList[index].thumb_up = resp.checked;
      notifyListeners();
    } else {
      var resp = await thumbDown(userId, newsList[index].article_id, token,
          !newsList[index].thumb_down);
      logger.i("low+ $resp ");
      newsList[index].thumb_down_count = resp.count;
      newsList[index].thumb_down = resp.checked;
      notifyListeners();
    }
  }

  refreshNewsAction(String date, String type) async {
    var resp = await refreshArticleList("", "", date, 5);
    List<ArticleListItem> list = resp.article_list;
    if (type == "1") {
      newsList = list.followedBy(newsList);
      notifyListeners();
    } else {
      newsList.addAll(list);
      notifyListeners();
    }
  }

  readCount(String userId, String token, int index) async {
    var resp = await getArticle(userId, newsList[index].article_id, token);
    newsList[index].read_count = resp.read_count;
    notifyListeners();
  }
}

class PersonalAction extends ChangeNotifier {
  PreOrderResp createResult;

  payAction(String userId, String token, String goodsId, context) async {
    createResult = await createPreOrder(userId, goodsId, 1, token);
    logger.i("creatresult: $createResult");
    return createResult.err.desc;
  }
}
