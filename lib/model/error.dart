//TODO: this is for data structure

//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
part 'error.g.dart';

@JsonSerializable()
class Error {
  int code;
  String desc;

  Error({
    this.code,
    this.desc,
  });

  factory Error.fromJson(Map<String, dynamic> json) =>
      _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return '{'
        'code: $code, '
        'desc: $desc, '
        '}';
  }
}
