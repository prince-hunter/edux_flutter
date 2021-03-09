//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import "../error.dart";
part 'article.g.dart';

@JsonSerializable()
class ArticleReq {
  String user_id;
  String article_id;
  String token;


  ArticleReq({
    this.user_id,
    this.article_id,
    this.token,
  });

  factory ArticleReq.fromJson(Map<String, dynamic> json) =>
      _$ArticleReqFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleReqToJson(this);

  @override
  String toString() {
    return '{'
        'user_id: $user_id, '
        'article_id: $article_id, '
        'token: $token, '
        '}';
  }
}

@JsonSerializable()
class ArticleResp {
  String title;
  String avatar; // sms or password
  String author_name;
  String author_id;
  String publish_time;
  bool save; //收藏
  int save_count;
  bool follow; //关注
  String content;
  bool thumb_up;
  int thumb_up_count;
  bool thumb_down;
  int thumb_down_count;
  int read_count; //阅读量
  String article_id;
  Error err;

  ArticleResp({
    this.title,
    this.avatar,
    this.author_name,
    this.author_id,
    this.publish_time,
    this.save,
    this.save_count,
    this.follow,
    this.content,
    this.thumb_up,
    this.thumb_up_count,
    this.thumb_down,
    this.thumb_down_count,
    this.read_count,
    this.article_id,
    this.err,
  });

  factory ArticleResp.fromJson(Map<String, dynamic> json) =>
      _$ArticleRespFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleRespToJson(this);

  @override
  String toString() {
    return '{'
        'title: $title, '
        'avatar: $avatar, '
        'author_name: $author_name, '
        'author_id: $author_id, '
        'publish_time: $publish_time, '
        'save: $save, '
        'save_count: $save_count, '
        'follow: $follow, '
        'content: $content, '
        'thumb_up: $thumb_up, '
        'thumb_up_count: $thumb_up_count, '
        'thumb_down: $thumb_down, '
        'thumb_down_count: $thumb_down_count, '
        'readCount: $read_count, '
        'article_id: $article_id, '
        'err: $err, '
        '}';
  }
}
