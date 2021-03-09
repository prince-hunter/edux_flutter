//TODO: this is for data structure

import 'package:json_annotation/json_annotation.dart';
part 'pay_history_item.g.dart';

@JsonSerializable()
class PayHistoryItem {
  String product_id;
  String product_name;
  String description;
  String order_id;
  String order_date;
  String pay_date;
  String valid_start_date;
  String valid_stop_date;
  int count;
  int price;

  PayHistoryItem({
    this.product_id,
    this.product_name,
    this.description,
    this.order_id,
    this.order_date,
    this.pay_date,
    this.valid_start_date,
    this.valid_stop_date,
    this.count,
    this.price,
  });

  factory PayHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$PayHistoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$PayHistoryItemToJson(this);

  @override
  String toString() {
    return '{'
        'product_id: $product_id, '
        'product_name: $product_name, '
        'description: $description, '
        'order_id: $order_id'
        'order_date: $order_date'
        'pay_date: $pay_date'
        'valid_start_date: $valid_start_date'
        'valid_stop_date: $valid_stop_date'
        'count: $count'
        'price: $price'
        '}';
  }
}
