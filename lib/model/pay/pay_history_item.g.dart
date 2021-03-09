// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayHistoryItem _$PayHistoryItemFromJson(Map<String, dynamic> json) {
  return PayHistoryItem(
    product_id: json['product_id'] as String,
    product_name: json['product_name'] as String,
    description: json['description'] as String,
    order_id: json['order_id'] as String,
    order_date: json['order_date'] as String,
    pay_date: json['pay_date'] as String,
    valid_start_date: json['valid_start_date'] as String,
    valid_stop_date: json['valid_stop_date'] as String,
    count: json['count'] as int,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$PayHistoryItemToJson(PayHistoryItem instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'description': instance.description,
      'order_id': instance.order_id,
      'order_date': instance.order_date,
      'pay_date': instance.pay_date,
      'valid_start_date': instance.valid_start_date,
      'valid_stop_date': instance.valid_stop_date,
      'count': instance.count,
      'price': instance.price,
    };
