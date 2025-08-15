import 'package:json_annotation/json_annotation.dart';
import 'package:np2024_01/models/order/orderDetailFf.dart';

part 'orderDetail.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderDetail {
  int progressivo;
  int id;
  String name;
  double price;
  double totale;
  int qt;
  List<orderDetailFF> odd = [];

  OrderDetail({
    required this.progressivo,
    required this.id,
    required this.name,
    required this.price,
    required this.qt,
    required this.totale,
    required this.odd,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
