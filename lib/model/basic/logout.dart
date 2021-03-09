//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'logout.g.dart';

@JsonSerializable()
class LogoutReq {
  String token;

  LogoutReq({
    this.token,
  });

  factory LogoutReq.fromJson(Map<String, dynamic> json) =>
      _$LogoutReqFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutReqToJson(this);

  @override
  String toString() {
    return '{'
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class LogoutResp {
  String user_name;
  Error err;

  LogoutResp({
    this.user_name,
    this.err,
  });

  factory LogoutResp.fromJson(Map<String, dynamic> json) =>
      _$LogoutRespFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutRespToJson(this);

  @override
  String toString() {
    return '{'
    'user_name: $user_name, '
    'err: $err, '
        '}';
  }
}
