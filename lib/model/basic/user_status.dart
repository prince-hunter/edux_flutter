//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'user_status.g.dart';

@JsonSerializable()
class UserStatusReq {
  String user_id;
  String token;


  UserStatusReq({
    this.user_id,
    this.token,
  });

  factory UserStatusReq.fromJson(Map<String, dynamic> json) =>
      _$UserStatusReqFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatusReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class UserStatusResp {
  String user_id;
  String user_name;
  String token; // sms or password
  String avatar;
  String phone;
  String email;
  String end_date;
  String combo;
  String combo_avatar;
  String version;
  String help;
  Error err;

  UserStatusResp({
    this.user_id,
    this.user_name,
    this.token,
    this.avatar,
    this.phone,
    this.email,
    this.end_date,
    this.combo,
    this.combo_avatar,
    this.version,
    this.help,
    this.err,
  });

  factory UserStatusResp.fromJson(Map<String, dynamic> json) =>
      _$UserStatusRespFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatusRespToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'user_name: $user_name, '
        'token: $token, '
        'avatar: $avatar, '
        'phone: $phone, '
        'email: $email, '
        'enddate: $end_date, '
        'combo: $combo, '
        'combo_avatar: $combo_avatar, '
        'version: $version, '
        'help: $help, '
        'err: $err, '
        '}';
  }
}
