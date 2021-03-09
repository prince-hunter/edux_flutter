import 'package:edux_app/model/User.dart';
import 'package:edux_app/utiles/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future setUserInfo(String userName, String unionid, String imageURL, String token,
    String deadline,String password) async {
  logger.i('set userINFO');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  await prefs.setString('userName', userName);
  await prefs.setString('unionid', unionid);
  await prefs.setString('imageURL', imageURL);
  await prefs.setString('token', token);
  await prefs.setString('deadline', deadline);
  await prefs.setString('password', password);
  logger.i("数据持久化完成了");
}


Future getUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    User.username = prefs.get("userName");
    User.userImgUrl = prefs.get("imageURL");
    User.userUnionid = prefs.get("unionid");
    User.userToken = prefs.get("token");
    User.deadline = prefs.get("deadline");
    User.password = prefs.get("password");
    logger.d("loginModel is ${User.userToken}");
    print(prefs.get("deadline"));
}