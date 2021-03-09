//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
part 'ip_product_item.g.dart';

@JsonSerializable()
class IpProductItem {
  String  product_id;
  String  product_name;
  String  avatar_big;
  String  avatar_small;
  String  description;
  String  valid_start;
  String  valid_stop;
  int price;
  int duration;

  IpProductItem({
    this.product_id,
    this.product_name,
    this.avatar_big,
    this.avatar_small,
    this.description,
    this.valid_start,
    this.valid_stop,
    this.price,
    this.duration,
  });

  factory IpProductItem.fromJson(Map<String, dynamic> json) =>
      _$IpProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$IpProductItemToJson(this);

  @override
  String toString() {
    return '{'
        'product_id: $product_id, '
        'product_name: $product_name'
        'avatar_big: $avatar_big'
        'avatar_small: $avatar_small'
        'description: $description'
        'valid_start: $valid_start'
        'valid_stop: $valid_stop'
        'price: $price'
        'duration: $duration'
        '}';
  }
}

