import 'package:edux_app/api/pay.dart';
import 'package:edux_app/model/pay/pre_order.dart';
import 'package:edux_app/utiles/logger.dart';

class User {
   bool is_vip = false;
   bool is_payed = false;
   static bool is_logined = false;
   static bool is_connect = false;
   static String username = 'public';
   static String password = '';
   static String userImgUrl = '';
   static String userUnionid = '';
   static String userToken = '';
   static String deadline = '';
   String phonenumber = '';
   String email = '';
   DateTime avail_time = null;
   int Favorites_count = 100;
   double storaged_space = 7.0;
   double remained_space = 6.0;
   double traffice_up = 0.0;
   double traffice_down = 0.0;

   payAction(String userId, String token, String goodsId) async {
      PreOrderResp createResult = await createPreOrder(userId, goodsId, 1, token);
      logger.i("creatresult: $createResult");
      return createResult;
   }
}
