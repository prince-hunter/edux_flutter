// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeReq _$CodeReqFromJson(Map<String, dynamic> json) {
  return CodeReq(
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$CodeReqToJson(CodeReq instance) => <String, dynamic>{
      'phone': instance.phone,
    };

CodeResp _$CodeRespFromJson(Map<String, dynamic> json) {
  return CodeResp(
    user_name: json['user_name'] as String,
    code: json['code'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CodeRespToJson(CodeResp instance) => <String, dynamic>{
      'user_name': instance.user_name,
      'code': instance.code,
      'err': instance.err,
    };
