//TODO: this is for ss interface
// task owner: haogle
import 'package:edux_app/utiles/logger.dart';

import "../dioHelper/dio_helper.dart";
import 'package:dio/dio.dart';
import "../conf/url.dart";
import "../model/pay/pay_history_ip_product.dart";
import "../model/product/ip_product.dart";

Dio dio = DioHelper().dio;

getIPProductReq(String userId, String token) async {
  IpProductReq req = IpProductReq();
  req.user_id = userId;
  req.token = token;
  logger.d(userId);
  logger.d(token);
  logger.d(req.user_id);
  logger.d(req.token);


  try {
    Response respData = Response();
    respData = await dio.post(
      URL.IP_PRODUCT_LIST,
      data: req.toJson(),
    );

    return IpProductResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.IP_PRODUCT_LIST);
    logger.e(e.toString());

  }

  return IpProductResp();
}
