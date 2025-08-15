import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:np2024_01/models/customer/Customer.dart';
import 'package:np2024_01/models/order/orderDetail.dart';

part 'Orders.g.dart';

@JsonSerializable(explicitToJson: true)
class Orders {
  final int? id;
  final int? order_time;
  final int? creation_time;
  Customer? customer;
  List<OrderDetail> orderDet = [];

  Orders(this.id, this.order_time, this.creation_time, this.customer, this.orderDet);

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);

  /* Orders.fromJosn(Map<String, dynamic> json) {
    id = json['id'];
    order_time = json['order_time'];
    creation_time = json['creation_time'];
    customer = Customer.fromJson(jsonDecode(json['customer']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_tinme': order_time,
      'creation_time': creation_time,
      'costumer': jsonDecode(costumer)
    };
  }*/
}
