import 'package:coin_journey/core/resources/data_state.dart';
import 'package:coin_journey/features/markets/data/data_sources/remote/market_api_service.dart';
import 'package:coin_journey/features/markets/domain/entities/market.dart';
import 'package:coin_journey/features/markets/domain/repository/market_repository.dart';
import 'package:dio/dio.dart';

class MarketRepositoryImp implements MarketRepository {
  final MarketApiService _marketApiService;

  MarketRepositoryImp(this._marketApiService);

  @override
  Future<DataState<List<MarketEntity>>> getMarket() async {
    try {
      final result = await _marketApiService.getMarkets();
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
