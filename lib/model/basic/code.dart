//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'code.g.dart';

@JsonSerializable()
class CodeReq {
  String phone;

  CodeReq({
    this.phone,
  });

  factory CodeReq.fromJson(Map<String, dynamic> json) =>
      _$CodeReqFromJson(json);

  Map<String, dynamic> toJson() => _$CodeReqToJson(this);

  @override
  String toString() {
    return '{'
        'phone: $phone, '
        '}';
  }
}

@JsonSerializable()
class CodeResp {
  String user_name;
  String code; // sms or password
  Error err;

  CodeResp({
    this.user_name,
    this.code,
    this.err,
  });

  factory CodeResp.fromJson(Map<String, dynamic> json) =>
      _$CodeRespFromJson(json);

  Map<String, dynamic> toJson() => _$CodeRespToJson(this);

  @override
  String toString() {
    return '{'
        'user_name: $user_name, '
        'code: $code, '
        'err: $err, '
        '}';
  }
}
