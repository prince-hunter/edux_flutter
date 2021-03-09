//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
part 'file_list_item.g.dart';

@JsonSerializable()
class FileListItem {
  String name;
  int file_type;
  String modify_time;

  FileListItem({
    this.name,
    this.file_type,
    this.modify_time,
  });

  factory FileListItem.fromJson(Map<String, dynamic> json) =>
      _$FileListItemFromJson(json);

  Map<String, dynamic> toJson() => _$FileListItemToJson(this);

  @override
  String toString() {
    return '{'
        'title: $name, '
        'file_type: $file_type, '
        'modify_time: $modify_time, '
        '}';
  }
}
