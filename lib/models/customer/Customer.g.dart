// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      (json['id'] as num?)?.toInt(),
      json['last_name'] as String?,
      json['first_name'] as String?,
      json['telephone_number'] as String?,
      json['address'] as String?,
      json['cf'] as String?,
      json['piva'] as String?,
      json['note'] as String?,
      json['short_name'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'short_name': instance.short_name,
      'telephone_number': instance.telephone_number,
      'address': instance.address,
      'cf': instance.cf,
      'piva': instance.piva,
      'note': instance.note,
    };
