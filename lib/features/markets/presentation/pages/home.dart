import 'package:coin_journey/features/markets/presentation/bloc/market_bloc.dart';
import 'package:coin_journey/features/markets/presentation/bloc/market_event.dart';
import 'package:coin_journey/features/markets/presentation/bloc/market_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MarketBloc, MarketState>(
        builder: (_, state) {
          if (state is MarketLoading) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<MarketBloc>(context).add(const GetMarkets());
                  },
                  child: const Text('Get data'),
                ),
              ],
            ));
          }

          if (state is MarketError) {
            return const Center(child: Icon(Icons.error));
          }

          if (state is MarketDone) {
            return ListView.builder(
              itemCount: state.markets!.length,
              itemBuilder: (context, index) {
                final markets = state.markets!;
                final market = markets[index];

                return ListTile(
                  leading: Text('${market.marketCapRank}'),
                  title: Text('${market.name}'),
                  subtitle: Text('${market.marketCap}'),
                  trailing: Text('${market.currentPrice}'),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
