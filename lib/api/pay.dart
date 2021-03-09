//TODO: this is for ss interface
// task owner: haogle

import 'package:edux_app/model/pay/wx_query_order.dart';
import 'package:edux_app/utiles/logger.dart';

import "../dioHelper/dio_helper.dart";
import 'package:dio/dio.dart';
import "../conf/url.dart";
import "../model/pay/pay_history_ip_product.dart";
import "../model/pay/pre_order.dart";

Dio dio = DioHelper().dio;

getPayHistory(String userId, String token) async {
  PayHistoryIPProductReq req = PayHistoryIPProductReq();
  req.user_id = userId;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.PAY_LIST_IP_PRODUCT,
      data: req.toJson(),
    );

    return PayHistoryIPProductResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.PAY_LIST_IP_PRODUCT);
    logger.e(e.toString());
  }

  return PayHistoryIPProductResp();
}

createPreOrder(String userId, String productID, int count, String token) async {
  PreOrderReq req = PreOrderReq();
  req.user_id = userId;
  req.token = token;
  req.product_id = productID;
  req.count = count;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.PRE_ORDER_REQ,
      data: req.toJson(),
    );

    return PreOrderResp.fromJson((respData).data);
  } catch (e) {
    logger.e(URL.PRE_ORDER_REQ);
    logger.e(e.toString());
  }

  return PreOrderResp();

}

Future<WxQueryOrderResp> getOrder(String userId, String token, String orderId) async {
  WxQueryOrderReq req = WxQueryOrderReq();
  req.user_id = userId;
  req.token = token;

  try {
    Response respData = Response();
    respData = await dio.post(
      URL.QUERY_ORDER,
      data: req.toJson(),
    );

    WxQueryOrderResp ret = WxQueryOrderResp.fromJson((respData).data);
    logger.i(ret.toString());

    return ret;
  } catch (e) {
    logger.e(URL.QUERY_ORDER);
    logger.e(e.toString());
  }

  return WxQueryOrderResp();
}
