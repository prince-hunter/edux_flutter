//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'ss_config.g.dart';

@JsonSerializable()
class SSConfigReq {
  String user_id;
  String code;

  SSConfigReq({
    this.user_id,
    this.code,
  });

  factory SSConfigReq.fromJson(Map<String, dynamic> json) =>
      _$SSConfigReqFromJson(json);

  Map<String, dynamic> toJson() => _$SSConfigReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'code: $code, '
        '}';
  }
}

@JsonSerializable()
class SSConfigResp {
  String config;
  Error err;

  SSConfigResp({
    this.config,
    this.err,
  });

  factory SSConfigResp.fromJson(Map<String, dynamic> json) =>
      _$SSConfigRespFromJson(json);

  Map<String, dynamic> toJson() => _$SSConfigRespToJson(this);

  @override
  String toString() {
    return '{'
        'config: $config, '
        'err: $err, '
        '}';
  }
}
