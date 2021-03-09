// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatusReq _$UserStatusReqFromJson(Map<String, dynamic> json) {
  return UserStatusReq(
    user_id: json['user_id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserStatusReqToJson(UserStatusReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'token': instance.token,
    };

UserStatusResp _$UserStatusRespFromJson(Map<String, dynamic> json) {
  return UserStatusResp(
    user_id: json['user_id'] as String,
    user_name: json['user_name'] as String,
    token: json['token'] as String,
    avatar: json['avatar'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    end_date: json['end_date'] as String,
    combo: json['combo'] as String,
    combo_avatar: json['combo_avatar'] as String,
    version: json['version'] as String,
    help: json['help'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserStatusRespToJson(UserStatusResp instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'token': instance.token,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'email': instance.email,
      'end_date': instance.end_date,
      'combo': instance.combo,
      'combo_avatar': instance.combo_avatar,
      'version': instance.version,
      'help': instance.help,
      'err': instance.err,
    };
