// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedArticleListReq _$SavedArticleListReqFromJson(Map<String, dynamic> json) {
  return SavedArticleListReq(
    user_id: json['user_id'] as String,
    date: json['date'] as String,
    count: json['count'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$SavedArticleListReqToJson(
        SavedArticleListReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'date': instance.date,
      'count': instance.count,
      'token': instance.token,
    };

SavedArticleListResp _$SavedArticleListRespFromJson(Map<String, dynamic> json) {
  return SavedArticleListResp(
    saved_article_list: (json['saved_article_list'] as List)
        ?.map((e) => e == null
            ? null
            : SavedArticleListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SavedArticleListRespToJson(
        SavedArticleListResp instance) =>
    <String, dynamic>{
      'saved_article_list': instance.saved_article_list,
      'err': instance.err,
    };

SavedArticleListItem _$SavedArticleListItemFromJson(Map<String, dynamic> json) {
  return SavedArticleListItem(
    title: json['title'] as String,
    article_id: json['article_id'] as String,
  );
}

Map<String, dynamic> _$SavedArticleListItemToJson(
        SavedArticleListItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'article_id': instance.article_id,
    };
