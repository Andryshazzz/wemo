import 'package:json_annotation/json_annotation.dart';

part 'coin_dto.g.dart';

@JsonSerializable()
class CoinDto {
  final String name;
  final int price;

  CoinDto({required this.name, required this.price});

  factory CoinDto.fromJson(Map<String, Object?> json) =>
      _$CoinDtoFromJson(json);
}
