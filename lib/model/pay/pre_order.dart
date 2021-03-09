//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'pre_order.g.dart';

@JsonSerializable()
class PreOrderReq {
  String user_id;
  String token;
  String product_id;
  int count;

  PreOrderReq({
    this.user_id,
    this.token,
    this.product_id,
    this.count,
  });

  factory PreOrderReq.fromJson(Map<String, dynamic> json) =>
      _$PreOrderReqFromJson(json);

  Map<String, dynamic> toJson() => _$PreOrderReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'token: $token'
        'product_id: $product_id'
        'amount: $count'
        '}';
  }
}

@JsonSerializable()
class PreOrderResp {
  String app_id;
  String partner_id;
  String prepay_id;
  String package;
  String nonce_str;
  int time_stamp;
  String sign;
  Error err;

  PreOrderResp({
    this.app_id,
    this.partner_id,
    this.prepay_id,
    this.package,
    this.nonce_str,
    this.time_stamp,
    this.sign,
    this.err,
  });

  factory PreOrderResp.fromJson(Map<String, dynamic> json) =>
      _$PreOrderRespFromJson(json);

  Map<String, dynamic> toJson() => _$PreOrderRespToJson(this);

  @override
  String toString() {
    return '{'
        'app_id: $app_id, '
        'partner_id: $partner_id'
        'prepay_id: $prepay_id'
        'package_value: $package'
        'nonce_str: $nonce_str'
        'time_stamp: $time_stamp'
        'sign: $sign'
        'err: $err'
        '}';
  }
}
