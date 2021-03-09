// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpProductReq _$IpProductReqFromJson(Map<String, dynamic> json) {
  return IpProductReq(
    user_id: json['user_id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$IpProductReqToJson(IpProductReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
    };

IpProductResp _$IpProductRespFromJson(Map<String, dynamic> json) {
  return IpProductResp(
    ip_product_list: (json['ip_product_list'] as List)
        ?.map((e) => e == null
            ? null
            : IpProductItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IpProductRespToJson(IpProductResp instance) =>
    <String, dynamic>{
      'ip_product_list': instance.ip_product_list,
      'err': instance.err,
    };
