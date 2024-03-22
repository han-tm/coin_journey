import 'package:coin_journey/features/markets/domain/entities/market.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class MarketState extends Equatable {
  final List<MarketEntity>? markets;
  final DioException? error;

  const MarketState({this.markets, this.error});

  @override
  List<Object?> get props => [markets, error];
}

class MarketLoading extends MarketState {
  const MarketLoading();
}

class MarketDone extends MarketState {
  const MarketDone(List<MarketEntity> markets) : super(markets: markets);
}



class MarketError extends MarketState {
  const MarketError(DioException error) : super(error: error);
}