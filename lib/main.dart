import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_package/features/historical_price/presentation/bloc/historical_price_bloc.dart';
import 'package:my_package/features/historical_price/presentation/pages/home_page.dart';
import 'package:my_package/injection_container.dart'
    as di;

import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historical Price Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => serviceLocator<HistoricalPriceBloc>(),
        child: const HomePage(title: 'Historical Price Home Page'),
      ),
    );
  }
}
