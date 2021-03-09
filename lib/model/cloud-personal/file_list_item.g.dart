// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileListItem _$FileListItemFromJson(Map<String, dynamic> json) {
  return FileListItem(
    name: json['name'] as String,
    file_type: json['file_type'] as int,
    modify_time: json['modify_time'] as String,
  );
}

Map<String, dynamic> _$FileListItemToJson(FileListItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'file_type': instance.file_type,
      'modify_time': instance.modify_time,
    };
