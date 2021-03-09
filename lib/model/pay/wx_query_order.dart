//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'wx_query_order.g.dart';

@JsonSerializable()
class WxQueryOrderReq {
  String user_id;
  String token;
  String order_id;

  WxQueryOrderReq({
    this.user_id,
    this.token,
    this.order_id,
  });

  factory WxQueryOrderReq.fromJson(Map<String, dynamic> json) =>
      _$WxQueryOrderReqFromJson(json);

  Map<String, dynamic> toJson() => _$WxQueryOrderReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'token: $token'
        'order_id: $order_id'
        '}';
  }
}

@JsonSerializable()
class WxQueryOrderResp {
  bool paid;
  String dead_line;
  Error err;

  WxQueryOrderResp({

    this.paid,
    this.dead_line,
    this.err,
  });

  factory WxQueryOrderResp.fromJson(Map<String, dynamic> json) =>
      _$WxQueryOrderRespFromJson(json);

  Map<String, dynamic> toJson() => _$WxQueryOrderRespToJson(this);

  @override
  String toString() {
    return '{'
        'paid: $paid, '
        'dead_line: $dead_line'
        'err: $err'
        '}';
  }
}
