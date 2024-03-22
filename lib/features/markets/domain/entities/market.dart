import 'package:equatable/equatable.dart';

class MarketEntity extends Equatable {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final num? currentPrice;
  final num? marketCap;
  final num? marketCapRank;
  final num? high24h;
  final num? min24h;
  final num? priceChange24h;
  final num? priceChangePercentage24h;
  final List<num>? sparklineIn7d;

  const MarketEntity({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.high24h,
    this.min24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.sparklineIn7d,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCap,
        marketCapRank,
        high24h,
        min24h,
        priceChange24h,
        priceChangePercentage24h,
        sparklineIn7d,
      ];
}
