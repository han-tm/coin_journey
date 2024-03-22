import 'package:coin_journey/core/resources/data_state.dart';
import 'package:coin_journey/core/usecases/usercases.dart';
import 'package:coin_journey/features/markets/domain/entities/market.dart';
import 'package:coin_journey/features/markets/domain/repository/market_repository.dart';

class GetMarketsUseCase implements UseCase<DataState<List<MarketEntity>>, void> {
  final MarketRepository _marketRepository;

  GetMarketsUseCase(this._marketRepository);

  @override
  Future<DataState<List<MarketEntity>>> call({void params}) {
    return _marketRepository.getMarket();
  }
}
