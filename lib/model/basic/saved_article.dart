//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'saved_article.g.dart';

@JsonSerializable()
class SavedArticleListReq {
  String user_id;
  String date;
  int count;
  String token;

  SavedArticleListReq({
    this.user_id,
    this.date,
    this.count,
    this.token,
  });

  factory SavedArticleListReq.fromJson(Map<String, dynamic> json) =>
      _$SavedArticleListReqFromJson(json);

  Map<String, dynamic> toJson() => _$SavedArticleListReqToJson(this);

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
class SavedArticleListResp {
  List <SavedArticleListItem> saved_article_list;
  Error err;

  SavedArticleListResp({
    this.saved_article_list = const [],
    this.err,
  });

  factory SavedArticleListResp.fromJson(Map<String, dynamic> json) =>
      _$SavedArticleListRespFromJson(json);

  Map<String, dynamic> toJson() => _$SavedArticleListRespToJson(this);

  @override
  String toString() {
    return '{'
        'savedArticleList: $saved_article_list, '
        'err: $err, '
        '}';
  }
}


@JsonSerializable()
class SavedArticleListItem {
  String title;
  String article_id;

  SavedArticleListItem({
    this.title,
    this.article_id,
  });

  factory SavedArticleListItem.fromJson(Map<String, dynamic> json) =>
      _$SavedArticleListItemFromJson(json);

  Map<String, dynamic> toJson() => _$SavedArticleListItemToJson(this);

  @override
  String toString() {
    return '{'
        'title: $title, '
        'article_id: $article_id, '
        '}';
  }
}
