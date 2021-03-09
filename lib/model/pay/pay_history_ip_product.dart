//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import 'pay_history_item.dart';
import "../error.dart";
part 'pay_history_ip_product.g.dart';

@JsonSerializable()
class PayHistoryIPProductReq {
  String user_id;
  String token;

  PayHistoryIPProductReq({
    this.user_id,
    this.token,
  });

  factory PayHistoryIPProductReq.fromJson(Map<String, dynamic> json) =>
      _$PayHistoryIPProductReqFromJson(json);

  Map<String, dynamic> toJson() => _$PayHistoryIPProductReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class PayHistoryIPProductResp {
  final List <PayHistoryItem> pay_history_ip_product_list;
  Error err;

  PayHistoryIPProductResp({
    this.pay_history_ip_product_list = const [],
    this.err,
});

  factory PayHistoryIPProductResp.fromJson(Map<String, dynamic> json) =>
      _$PayHistoryIPProductRespFromJson(json);

  Map<String, dynamic> toJson() => _$PayHistoryIPProductRespToJson(this);

  @override
  String toString() {
    return '{'
        'pay_history_ip_product_list: $pay_history_ip_product_list'
        'err: $err'
        '}';
  }
}

