import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_package/features/historical_price/presentation/widgets/price_cell.dart';

import '../bloc/historical_price_bloc.dart';
import '../bloc/historical_price_event.dart';
import '../bloc/historical_price_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late HistoricalPriceBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HistoricalPriceBloc>(context)
      ..add(GetHistoricalPriceEvent());
    _bloc.stream.listen((state) {
      if (state is Error) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Error"),
            content: Text(state.message),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<HistoricalPriceBloc, HistoricalPriceState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return Column(
              children: [
                Text(
                  state.historicalResponse.symbol ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return PriceCell(
                      historical: state.historicalResponse.historical[index],
                    );
                  }),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
