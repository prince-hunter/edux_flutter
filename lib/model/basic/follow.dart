//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'follow.g.dart';

@JsonSerializable()
class FollowOfficialAccountsReq {
  String user_id;
  String official_accounts_id;
  String token;
  bool check;

  FollowOfficialAccountsReq({
    this.user_id,
    this.official_accounts_id,
    this.token,
    this.check,
  });

  factory FollowOfficialAccountsReq.fromJson(Map<String, dynamic> json) =>
      _$FollowOfficialAccountsReqFromJson(json);

  Map<String, dynamic> toJson() => _$FollowOfficialAccountsReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'official_accounts_id: $official_accounts_id, '
        'token: $token, '
        'check: $check, '
        '}';
  }
}

@JsonSerializable()
class FollowOfficialAccountsResp {
  bool checked;
  Error err;

  FollowOfficialAccountsResp({
    this.checked,
    this.err,
  });

  factory FollowOfficialAccountsResp.fromJson(Map<String, dynamic> json) =>
      _$FollowOfficialAccountsRespFromJson(json);

  Map<String, dynamic> toJson() => _$FollowOfficialAccountsRespToJson(this);

  @override
  String toString() {
    return '{'
        'checked: $checked, '
        'err: $err, '
        '}';
  }
}
