// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListItem _$ArticleListItemFromJson(Map<String, dynamic> json) {
  return ArticleListItem(
    title: json['title'] as String,
    author_name: json['author_name'] as String,
    avatar: json['avatar'] as String,
    content: json['content'] as String,
    thumb_up: json['thumb_up'] as bool,
    thumb_up_count: json['thumb_up_count'] as int,
    thumb_down: json['thumb_down'] as bool,
    thumb_down_count: json['thumb_down_count'] as int,
    read_count: json['read_count'] as int,
    article_id: json['article_id'] as String,
  );
}

Map<String, dynamic> _$ArticleListItemToJson(ArticleListItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author_name': instance.author_name,
      'avatar': instance.avatar,
      'content': instance.content,
      'thumb_up': instance.thumb_up,
      'thumb_up_count': instance.thumb_up_count,
      'thumb_down': instance.thumb_down,
      'thumb_down_count': instance.thumb_down_count,
      'read_count': instance.read_count,
      'article_id': instance.article_id,
    };
