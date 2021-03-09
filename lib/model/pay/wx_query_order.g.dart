// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_query_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxQueryOrderReq _$WxQueryOrderReqFromJson(Map<String, dynamic> json) {
  return WxQueryOrderReq(
    user_id: json['user_id'] as String,
    token: json['token'] as String,
    order_id: json['order_id'] as String,
  );
}

Map<String, dynamic> _$WxQueryOrderReqToJson(WxQueryOrderReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
      'order_id': instance.order_id,
    };

WxQueryOrderResp _$WxQueryOrderRespFromJson(Map<String, dynamic> json) {
  return WxQueryOrderResp(
    paid: json['paid'] as bool,
    dead_line: json['dead_line'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WxQueryOrderRespToJson(WxQueryOrderResp instance) =>
    <String, dynamic>{
      'paid': instance.paid,
      'dead_line': instance.dead_line,
      'err': instance.err,
    };
