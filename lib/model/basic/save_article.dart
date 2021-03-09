//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'save_article.g.dart';

@JsonSerializable()
class SaveArticleReq {
  String user_id;
  String article_id;
  bool check;
  String token;

  SaveArticleReq({
    this.user_id,
    this.article_id,
    this.check,
    this.token,
  });

  factory SaveArticleReq.fromJson(Map<String, dynamic> json) =>
      _$SaveArticleReqFromJson(json);

  Map<String, dynamic> toJson() => _$SaveArticleReqToJson(this);

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
class SaveArticleResp {
  bool checked;
  Error err;

  SaveArticleResp({
    this.checked,
    this.err,
  });

  factory SaveArticleResp.fromJson(Map<String, dynamic> json) =>
      _$SaveArticleRespFromJson(json);

  Map<String, dynamic> toJson() => _$SaveArticleRespToJson(this);

  @override
  String toString() {
    return '{'
        'checked: $checked, '
        'err: $err, '
        '}';
  }
}
