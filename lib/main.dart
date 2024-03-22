import 'package:coin_journey/features/markets/presentation/bloc/market_bloc.dart';
import 'package:coin_journey/features/markets/presentation/bloc/market_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_theme.dart';
import 'di.dart';
import 'features/markets/presentation/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: BlocProvider<MarketBloc>(
          create: (context) => sl()..add(const GetMarkets()),
          child: const Home()));
  }
}
