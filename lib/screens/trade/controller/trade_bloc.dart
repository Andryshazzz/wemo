import 'package:bloc/bloc.dart';

import 'trade_event.dart';
import 'trade_state.dart';

class TradeBloc extends Bloc<TradeEvent, TradeState> {
  TradeBloc() : super(TradeState()) {
    on<TradeEvent>((event, emit) {});
  }
}
