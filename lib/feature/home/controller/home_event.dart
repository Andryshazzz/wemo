import 'package:flutter/foundation.dart';

@immutable
sealed class HomeEvent {}

final class LoadCoin extends HomeEvent {}

final class SellCoin extends HomeEvent {
  final String coinName;
  final double amount;
  final double price;

  SellCoin({required this.coinName, required this.amount, required this.price});
}

final class BuyCoin extends HomeEvent {
  final String coinName;
  final double amount;
  final double price;

  BuyCoin({required this.coinName, required this.amount, required this.price});
}
