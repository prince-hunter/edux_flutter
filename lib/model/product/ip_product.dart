//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import 'ip_product_item.dart';
import "../error.dart";
part 'ip_product.g.dart';

@JsonSerializable()
class IpProductReq {
  String user_id;
  String token;

  IpProductReq({
    this.user_id,
    this.token,
  });

  factory IpProductReq.fromJson(Map<String, dynamic> json) =>
      _$IpProductReqFromJson(json);

  Map<String, dynamic> toJson() => _$IpProductReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class IpProductResp {
  final List <IpProductItem> ip_product_list;
  Error err;

  IpProductResp({
    this.ip_product_list = const [],
    this.err,
  });

  factory IpProductResp.fromJson(Map<String, dynamic> json) =>
      _$IpProductRespFromJson(json);

  Map<String, dynamic> toJson() => _$IpProductRespToJson(this);

  @override
  String toString() {
    return '{'
        'ip_product_list: $ip_product_list, '
        'err: $err, '
        '}';
  }
}
