import 'package:json_annotation/json_annotation.dart';

part 'Customer.g.dart';

@JsonSerializable()
class Customer {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? short_name;
  final String? telephone_number;
  final String? address;
  final String? cf;
  final String? piva;
  final String? note;

  Customer(this.id, this.last_name, this.first_name, this.telephone_number,
      this.address, this.cf, this.piva, this.note, this.short_name);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  /* Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    short_name = json['short_name'];
    telephone_number = json['telephone_number'];
    address = json['address'];
    cf = json['cf'];
    piva = json['piva'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'short_name': short_name,
      'telephone_number': telephone_number,
      'address': address,
      'cf': cf,
      'piva': piva,
      'note': note
    };
  }*/
}
