// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreOrderReq _$PreOrderReqFromJson(Map<String, dynamic> json) {
  return PreOrderReq(
    user_id: json['user_id'] as String,
    token: json['token'] as String,
    product_id: json['product_id'] as String,
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$PreOrderReqToJson(PreOrderReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
      'product_id': instance.product_id,
      'count': instance.count,
    };

PreOrderResp _$PreOrderRespFromJson(Map<String, dynamic> json) {
  return PreOrderResp(
    app_id: json['app_id'] as String,
    partner_id: json['partner_id'] as String,
    prepay_id: json['prepay_id'] as String,
    package: json['package'] as String,
    nonce_str: json['nonce_str'] as String,
    time_stamp: json['time_stamp'] as int,
    sign: json['sign'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PreOrderRespToJson(PreOrderResp instance) =>
    <String, dynamic>{
      'app_id': instance.app_id,
      'partner_id': instance.partner_id,
      'prepay_id': instance.prepay_id,
      'package': instance.package,
      'nonce_str': instance.nonce_str,
      'time_stamp': instance.time_stamp,
      'sign': instance.sign,
      'err': instance.err,
    };
