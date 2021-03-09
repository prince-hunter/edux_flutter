//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'thumb.g.dart';

@JsonSerializable()
class ThumbUp {
  String user_id;
  String article_id;
  bool check;
  String token;


  ThumbUp({
    this.user_id,
    this.article_id,
    this.check,
    this.token,
  });

  factory ThumbUp.fromJson(Map<String, dynamic> json) =>
      _$ThumbUpFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbUpToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'article_id: $article_id, '
        'check: $check, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class ThumbDown {
  String user_id;
  String article_id;
  bool check;
  String token;


  ThumbDown({
    this.user_id,
    this.article_id,
    this.check,
    this.token,
  });

  factory ThumbDown.fromJson(Map<String, dynamic> json) =>
      _$ThumbDownFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbDownToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'article_id: $article_id, '
        'check: $check, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class ThumbResp {
  int count;
  bool checked;
  Error err;

  ThumbResp({
    this.count,
    this.checked,
    this.err,
  });

  factory ThumbResp.fromJson(Map<String, dynamic> json) =>
      _$ThumbRespFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbRespToJson(this);

  @override
  String toString() {
    return '{'
        'count: $count, '
        'checked: $checked, '
        'err: $err, '
        '}';
  }
}

