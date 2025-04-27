import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class Coin {
  final String name;
  final int price;

  Coin({required this.name, required this.price});

  factory Coin.fromJson(Map<String, Object?> json) => _$CoinFromJson(json);
}
