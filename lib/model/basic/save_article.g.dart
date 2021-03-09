// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveArticleReq _$SaveArticleReqFromJson(Map<String, dynamic> json) {
  return SaveArticleReq(
    user_id: json['user_id'] as String,
    article_id: json['article_id'] as String,
    check: json['check'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$SaveArticleReqToJson(SaveArticleReq instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'article_id': instance.article_id,
      'check': instance.check,
      'token': instance.token,
    };

SaveArticleResp _$SaveArticleRespFromJson(Map<String, dynamic> json) {
  return SaveArticleResp(
    checked: json['checked'] as bool,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SaveArticleRespToJson(SaveArticleResp instance) =>
    <String, dynamic>{
      'checked': instance.checked,
      'err': instance.err,
    };
