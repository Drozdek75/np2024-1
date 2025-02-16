import 'package:np2024_01/models/order/orderDetailFf.dart';

class Ingredient {
  int? id;
  String? name;
  String? description;
  double? price;
  double? cost;
  String? notes;
  List<orderDetailFF>? orderDetailF = [];
  List<String>? nutritionalValuesList = [];
  List<String>? allergenList = [];

  Ingredient(
      {required this.name,
      required this.description,
      required this.cost,
      required this.id,
      required this.notes,
      required this.price,
      this.orderDetailF,
      this.allergenList,
      this.nutritionalValuesList});

  Ingredient.fromJson(Map<String, dynamic> json) {
    List<orderDetailFF> lstODF = [];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    id = json['id'];
    if (json['notes'] == null) {
      notes = '';
    }
    price = json['price'];
    if (json['orderdetailF'] != null) {
      json['orderDetailF'].forEach((v) {
        lstODF.add(orderDetailFF.fromJson!(v.fromJson(v)));
      });
      orderDetailF = lstODF;
    } else {
      orderDetailF = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'cost': cost,
      'id': id,
      'notes': notes,
      'price': price,
      //  'orderDetailF': orderDetailF,
    };
  }
}
