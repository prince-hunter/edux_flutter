// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbUp _$ThumbUpFromJson(Map<String, dynamic> json) {
  return ThumbUp(
    user_id: json['user_id'] as String,
    article_id: json['article_id'] as String,
    check: json['check'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ThumbUpToJson(ThumbUp instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'article_id': instance.article_id,
      'check': instance.check,
      'token': instance.token,
    };

ThumbDown _$ThumbDownFromJson(Map<String, dynamic> json) {
  return ThumbDown(
    user_id: json['user_id'] as String,
    article_id: json['article_id'] as String,
    check: json['check'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$ThumbDownToJson(ThumbDown instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'article_id': instance.article_id,
      'check': instance.check,
      'token': instance.token,
    };

ThumbResp _$ThumbRespFromJson(Map<String, dynamic> json) {
  return ThumbResp(
    count: json['count'] as int,
    checked: json['checked'] as bool,
    err: json['err'] == null
        ? null
        : Error.fromJson(json['err'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThumbRespToJson(ThumbResp instance) => <String, dynamic>{
      'count': instance.count,
      'checked': instance.checked,
      'err': instance.err,
    };
