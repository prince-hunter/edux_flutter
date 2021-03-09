// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowOfficialAccountsReq _$FollowOfficialAccountsReqFromJson(
    Map<String, dynamic> json) {
  return FollowOfficialAccountsReq(
    user_id: json['user_id'] as String,
    official_accounts_id: json['official_accounts_id'] as String,
    token: json['token'] as String,
    check: json['check'] as bool,
  );
}

Map<String, dynamic> _$FollowOfficialAccountsReqToJson(
        FollowOfficialAccountsReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'official_accounts_id': instance.official_accounts_id,
      'token': instance.token,
      'check': instance.check,
    };

FollowOfficialAccountsResp _$FollowOfficialAccountsRespFromJson(
    Map<String, dynamic> json) {
  return FollowOfficialAccountsResp(
    checked: json['checked'] as bool,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FollowOfficialAccountsRespToJson(
        FollowOfficialAccountsResp instance) =>
    <String, dynamic>{
      'checked': instance.checked,
      'err': instance.err,
    };
