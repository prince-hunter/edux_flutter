// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutReq _$LogoutReqFromJson(Map<String, dynamic> json) {
  return LogoutReq(
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LogoutReqToJson(LogoutReq instance) => <String, dynamic>{
      'token': instance.token,
    };

LogoutResp _$LogoutRespFromJson(Map<String, dynamic> json) {
  return LogoutResp(
    user_name: json['user_name'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LogoutRespToJson(LogoutResp instance) =>
    <String, dynamic>{
      'user_name': instance.user_name,
      'err': instance.err,
    };
