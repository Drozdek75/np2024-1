class orderDetailFF {

  int? id;
  int? type;

  orderDetailFF({this.id, this.type});

  orderDetailFF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'type': 'type'};
  }
}
