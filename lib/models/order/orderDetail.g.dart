// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      id: (json['id'] as num).toInt(),
      progressivo: (json['progressivo'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      qt: (json['qt'] as num).toInt(),
      totale: (json['totale'] as num).toDouble(),
      odd: (json['odd'] as List<dynamic>)
          .map((e) => orderDetailFF.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'progressivo': instance.progressivo,
      'name': instance.name,
      'price': instance.price,
      'totale': instance.totale,
      'qt': instance.qt,
      'odd': instance.odd.map((e) => e.toJson()).toList(),
    };
