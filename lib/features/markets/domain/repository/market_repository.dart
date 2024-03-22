import 'package:coin_journey/core/resources/data_state.dart';
import 'package:coin_journey/features/markets/domain/entities/market.dart';

abstract class MarketRepository {
  Future<DataState<List<MarketEntity>>> getMarket();
}
