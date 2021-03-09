// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_history_ip_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayHistoryIPProductReq _$PayHistoryIPProductReqFromJson(
    Map<String, dynamic> json) {
  return PayHistoryIPProductReq(
    user_id: json['user_id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$PayHistoryIPProductReqToJson(
        PayHistoryIPProductReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
    };

PayHistoryIPProductResp _$PayHistoryIPProductRespFromJson(
    Map<String, dynamic> json) {
  return PayHistoryIPProductResp(
    pay_history_ip_product_list: (json['pay_history_ip_product_list'] as List)
        ?.map((e) => e == null
            ? null
            : PayHistoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PayHistoryIPProductRespToJson(
        PayHistoryIPProductResp instance) =>
    <String, dynamic>{
      'pay_history_ip_product_list': instance.pay_history_ip_product_list,
      'err': instance.err,
    };
