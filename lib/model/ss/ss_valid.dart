//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'ss_valid.g.dart';

@JsonSerializable()
class SSValidReq {
  String user_id;
  String token;

  SSValidReq({
    this.user_id,
    this.token,
  });

  factory SSValidReq.fromJson(Map<String, dynamic> json) =>
      _$SSValidReqFromJson(json);

  Map<String, dynamic> toJson() => _$SSValidReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'token: $token'
        '}';
  }
}

@JsonSerializable()
class SSValidResp {
  bool valid;
  Error err;

  SSValidResp({
    this.valid,
    this.err,
  });

  factory SSValidResp.fromJson(Map<String, dynamic> json) =>
      _$SSValidRespFromJson(json);

  Map<String, dynamic> toJson() => _$SSValidRespToJson(this);

  @override
  String toString() {
    return '{'
        'valid: $valid, '
        'err: $err'
        '}';
  }
}
