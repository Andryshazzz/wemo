import 'package:flutter/foundation.dart';

@immutable
sealed class HomeEvent {}

final class LoadCoin extends HomeEvent {}
