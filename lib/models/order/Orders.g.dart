// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      (json['id'] as num?)?.toInt(),
      (json['order_time'] as num?)?.toInt(),
      (json['creation_time'] as num?)?.toInt(),
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'id': instance.id,
      'order_time': instance.order_time,
      'creation_time': instance.creation_time,
      'customer': instance.customer?.toJson(),
    };
