//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
part 'article_list_item.g.dart';

@JsonSerializable()
class ArticleListItem {
  String title;
  String author_name;
  String avatar; // sms or password
  String content;
  bool thumb_up;
  int thumb_up_count;
  bool thumb_down;
  int thumb_down_count;
  int read_count;
  String article_id;

  ArticleListItem({
    this.title,
    this.author_name,
    this.avatar,
    this.content,
    this.thumb_up,
    this.thumb_up_count,
    this.thumb_down,
    this.thumb_down_count,
    this.read_count,
    this.article_id,
  });

  factory ArticleListItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleListItemFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListItemToJson(this);

  @override
  String toString() {
    return '{'
        'title: $title, '
        'user_name: $author_name, '
        'avatar: $avatar, '
        'content: $content, '
        'thumb_up: $thumb_up, '
        'thumb_up_count: $thumb_up_count, '
        'thumb_down: $thumb_down, '
        'thumb_down_count: $thumb_down_count, '
        'read_count: $read_count, '
        'id: $article_id, '
        '}';
  }
}
