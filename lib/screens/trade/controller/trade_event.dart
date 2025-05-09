import 'package:flutter/foundation.dart';

@immutable
sealed class TradeEvent {}

final class TradeLoadCoins extends TradeEvent {}
