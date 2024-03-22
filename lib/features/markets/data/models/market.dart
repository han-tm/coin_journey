import 'package:coin_journey/features/markets/domain/entities/market.dart';

class MarketModel extends MarketEntity {
  const MarketModel({
    String? id,
    String? symbol,
    String? name,
    String? image,
    num? currentPrice,
    num? marketCap,
    num? marketCapRank,
    num? high24h,
    num? min24h,
    num? priceChange24h,
    num? priceChangePercentage24h,
    List<num>? sparklineIn7d,
  }) : super(
          id: id,
          symbol: symbol,
          name: name,
          image: image,
          currentPrice: currentPrice,
          marketCap: marketCap,
          marketCapRank: marketCapRank,
          high24h: high24h,
          min24h: min24h,
          priceChange24h: priceChange24h,
          priceChangePercentage24h: priceChangePercentage24h,
          sparklineIn7d: sparklineIn7d,
        );

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'],
      marketCap: json['market_cap'],
      marketCapRank: json['market_cap_rank'],
      high24h: json['high_24h'],
      min24h: json['min24h'],
      priceChange24h: json['price_change_24h'],
      priceChangePercentage24h: json['price_change_percentage_24h'],
      sparklineIn7d: (((json['sparkline_in_7d'] as Map)['price']) as List<dynamic>).map((e) => e as double).toList(),
    );
  }
}
