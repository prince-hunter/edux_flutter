// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ss_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSConfigReq _$SSConfigReqFromJson(Map<String, dynamic> json) {
  return SSConfigReq(
    user_id: json['user_id'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$SSConfigReqToJson(SSConfigReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'code': instance.code,
    };

SSConfigResp _$SSConfigRespFromJson(Map<String, dynamic> json) {
  return SSConfigResp(
    config: json['config'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SSConfigRespToJson(SSConfigResp instance) =>
    <String, dynamic>{
      'config': instance.config,
      'err': instance.err,
    };
