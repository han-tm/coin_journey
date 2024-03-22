import 'package:coin_journey/core/resources/data_state.dart';
import 'package:coin_journey/features/markets/domain/usecases/get_matket.dart';
import 'package:coin_journey/features/markets/presentation/bloc/market_event.dart';
import 'package:coin_journey/features/markets/presentation/bloc/market_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final GetMarketsUseCase _getMarketsUseCase;

  MarketBloc(this._getMarketsUseCase) : super(const MarketLoading()) {
    on<GetMarkets>(onGetMarkets);
  }

  void onGetMarkets(GetMarkets event, Emitter<MarketState> emit) async {
    final dataState = await _getMarketsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(MarketDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(MarketError(dataState.error!));
    }
  }
}
