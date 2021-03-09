// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ss_valid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSValidReq _$SSValidReqFromJson(Map<String, dynamic> json) {
  return SSValidReq(
    user_id: json['user_id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$SSValidReqToJson(SSValidReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
    };

SSValidResp _$SSValidRespFromJson(Map<String, dynamic> json) {
  return SSValidResp(
    valid: json['valid'] as bool,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SSValidRespToJson(SSValidResp instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'err': instance.err,
    };
