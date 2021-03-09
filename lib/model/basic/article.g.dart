// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleReq _$ArticleReqFromJson(Map<String, dynamic> json) {
  return ArticleReq(
    user_id: json['user_id'] as String,
    article_id: json['article_id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ArticleReqToJson(ArticleReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'article_id': instance.article_id,
      'token': instance.token,
    };

ArticleResp _$ArticleRespFromJson(Map<String, dynamic> json) {
  return ArticleResp(
    title: json['title'] as String,
    avatar: json['avatar'] as String,
    author_name: json['author_name'] as String,
    author_id: json['author_id'] as String,
    publish_time: json['publish_time'] as String,
    save: json['save'] as bool,
    save_count: json['save_count'] as int,
    follow: json['follow'] as bool,
    content: json['content'] as String,
    thumb_up: json['thumb_up'] as bool,
    thumb_up_count: json['thumb_up_count'] as int,
    thumb_down: json['thumb_down'] as bool,
    thumb_down_count: json['thumb_down_count'] as int,
    read_count: json['read_count'] as int,
    article_id: json['article_id'] as String,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticleRespToJson(ArticleResp instance) =>
    <String, dynamic>{
      'title': instance.title,
      'avatar': instance.avatar,
      'author_name': instance.author_name,
      'author_id': instance.author_id,
      'publish_time': instance.publish_time,
      'save': instance.save,
      'save_count': instance.save_count,
      'follow': instance.follow,
      'content': instance.content,
      'thumb_up': instance.thumb_up,
      'thumb_up_count': instance.thumb_up_count,
      'thumb_down': instance.thumb_down,
      'thumb_down_count': instance.thumb_down_count,
      'read_count': instance.read_count,
      'article_id': instance.article_id,
      'err': instance.err,
    };
