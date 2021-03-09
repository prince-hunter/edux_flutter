//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import 'article_list_item.dart';
import "../error.dart";
part 'article_list.g.dart';

@JsonSerializable()
class ArticleListReq {
  String user_id;
  String date;
  int count;
  String token;

  ArticleListReq({
    this.user_id,
    this.date,
    this.count,
    this.token,
});

  factory ArticleListReq.fromJson(Map<String, dynamic> json) =>
      _$ArticleListReqFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'date: $date, '
        'count: $count, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class ArticleListResp {
  List <ArticleListItem> article_list;
  Error err;

  ArticleListResp({
    this.article_list = const [],
  });

  factory ArticleListResp.fromJson(Map<String, dynamic> json) =>
      _$ArticleListRespFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListRespToJson(this);

  @override
  String toString() {
    return '{'
        'article_list: $article_list, '
        'err: $err, '
        '}';
  }
}
