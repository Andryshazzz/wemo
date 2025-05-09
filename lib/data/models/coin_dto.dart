import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CoinDto {
  final String name;
  final double price;

  CoinDto({required this.name, required this.price});
}
