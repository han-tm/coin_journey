import 'package:coin_journey/config/conts/constants.dart';
import 'package:coin_journey/core/error/exception.dart';
import 'package:coin_journey/features/markets/data/models/market.dart';
import 'package:dio/dio.dart';

abstract class MarketApiService {
  Future<List<MarketModel>> getMarkets();
}

class MarketApiServiceImpl implements MarketApiService {
  final Dio dio;

  MarketApiServiceImpl({required this.dio});

  @override
  Future<List<MarketModel>> getMarkets() async {
    const String url = '$BASE_URL/coins/markets?vs_currency=usd&sparkline=true';
    Map<String, dynamic> header = {'x-cg-demo-api-key': API_KEY};
    final Response response = await dio.get(url, options: Options(headers: header));

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      return data.map((e) => MarketModel.fromJson(e)).toList();
    }else{
      throw ServerException();
    }
  }
}
