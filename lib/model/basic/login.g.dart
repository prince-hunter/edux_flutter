// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReqForClaim _$LoginReqForClaimFromJson(Map<String, dynamic> json) {
  return LoginReqForClaim(
    user_name: json['user_name'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$LoginReqForClaimToJson(LoginReqForClaim instance) =>
    <String, dynamic>{
      'user_name': instance.user_name,
      'code': instance.code,
    };

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) {
  return LoginReq(
    user_name: json['user_name'] as String,
    token: json['token'] as String,
    device_info: json['device_info'] as String,
  );
}

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'user_name': instance.user_name,
      'token': instance.token,
      'device_info': instance.device_info,
    };
