// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) =>
    Coin(name: json['name'] as String, price: (json['price'] as num).toInt());

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
};
