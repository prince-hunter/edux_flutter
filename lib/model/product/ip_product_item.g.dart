// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpProductItem _$IpProductItemFromJson(Map<String, dynamic> json) {
  return IpProductItem(
    product_id: json['product_id'] as String,
    product_name: json['product_name'] as String,
    avatar_big: json['avatar_big'] as String,
    avatar_small: json['avatar_small'] as String,
    description: json['description'] as String,
    valid_start: json['valid_start'] as String,
    valid_stop: json['valid_stop'] as String,
    price: json['price'] as int,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$IpProductItemToJson(IpProductItem instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'avatar_big': instance.avatar_big,
      'avatar_small': instance.avatar_small,
      'description': instance.description,
      'valid_start': instance.valid_start,
      'valid_stop': instance.valid_stop,
      'price': instance.price,
      'duration': instance.duration,
    };
