// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListReq _$ArticleListReqFromJson(Map<String, dynamic> json) {
  return ArticleListReq(
    user_id: json['user_id'] as String,
    date: json['date'] as String,
    count: json['count'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ArticleListReqToJson(ArticleListReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'date': instance.date,
      'count': instance.count,
      'token': instance.token,
    };

ArticleListResp _$ArticleListRespFromJson(Map<String, dynamic> json) {
  return ArticleListResp(
    article_list: (json['article_list'] as List)
        ?.map((e) => e == null
            ? null
            : ArticleListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..err = json['err'] == null
      ? null
      : Error.fromJson(json['err'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ArticleListRespToJson(ArticleListResp instance) =>
    <String, dynamic>{
      'article_list': instance.article_list,
      'err': instance.err,
    };
