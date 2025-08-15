class orderDetailFF {
  int? id;
  int? type;
  int? cod_product;

  orderDetailFF({this.id, this.type, this.cod_product});

  orderDetailFF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    cod_product = json['cod_product'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'type': 'type', 'cod_product': cod_product};
  }
}
