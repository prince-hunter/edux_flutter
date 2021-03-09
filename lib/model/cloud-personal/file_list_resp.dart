//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
import 'file_list_item.dart';
import "../error.dart";
part 'file_list_resp.g.dart';

@JsonSerializable()
class FileListResp {
  List <FileListItem> file_list;
  Error err;

  FileListResp({
      this.file_list = const [],
});

  factory FileListResp.fromJson(Map<String, dynamic> json) =>
      _$FileListRespFromJson(json);

  Map<String, dynamic> toJson() => _$FileListRespToJson(this);

  @override
  String toString() {
    return '{'
        'file_list: $file_list, '
        'err: $err, '
        '}';
  }
}
