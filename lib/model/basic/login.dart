//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";

part 'login.g.dart';

@JsonSerializable()
class LoginReqForClaim {
  String user_name;
  String code;

  LoginReqForClaim({this.user_name, this.code});

  factory LoginReqForClaim.fromJson(Map<String, dynamic> json) =>
      _$LoginReqForClaimFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqForClaimToJson(this);

  @override
  String toString() {
    return '{'
        'user_name: $user_name, '
        'code: $code, '
        '}';
  }
}

@JsonSerializable()
class LoginReq {
  String user_name;
  String token; // sms or password
  String device_info;

  LoginReq({this.user_name, this.token, this.device_info});

  factory LoginReq.fromJson(Map<String, dynamic> json) =>
      _$LoginReqFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_name: $user_name, '
        'token: $token, '
        'device_Info: $device_info, '
        '}';
  }
}
