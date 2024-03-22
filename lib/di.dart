import 'package:coin_journey/features/markets/data/data_sources/remote/market_api_service.dart';
import 'package:coin_journey/features/markets/domain/repository/market_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/markets/data/repository/market_repository_imp.dart';
import 'features/markets/domain/usecases/get_matket.dart';
import 'features/markets/presentation/bloc/market_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<MarketApiService>(MarketApiServiceImpl(dio: sl()));

  sl.registerSingleton<MarketRepository>(MarketRepositoryImp(sl()));

  //UseCases
  sl.registerSingleton<GetMarketsUseCase>(GetMarketsUseCase(sl()));

  //Blocs
  sl.registerFactory<MarketBloc>(() => MarketBloc(sl()));
}
