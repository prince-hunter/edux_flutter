// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_list_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileListResp _$FileListRespFromJson(Map<String, dynamic> json) {
  return FileListResp(
    file_list: (json['file_list'] as List)
        ?.map((e) =>
            e == null ? null : FileListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..err = json['err'] == null
      ? null
      : Error.fromJson(json['err'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FileListRespToJson(FileListResp instance) =>
    <String, dynamic>{
      'file_list': instance.file_list,
      'err': instance.err,
    };
