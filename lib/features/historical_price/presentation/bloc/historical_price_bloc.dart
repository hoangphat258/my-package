import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_historical_price.dart';
import 'historical_price_event.dart';
import 'historical_price_state.dart';

class HistoricalPriceBloc
    extends Bloc<HistoricalPriceEvent, HistoricalPriceState> {
  final GetHistoricalPrice getHistoricalPrice;

  HistoricalPriceBloc(this.getHistoricalPrice) : super(Empty()) {
    on<GetHistoricalPriceEvent>(_handleGetHistoricalPriceEvent);
  }

  Future<void> _handleGetHistoricalPriceEvent(
      GetHistoricalPriceEvent event, Emitter<HistoricalPriceState> emit) async {
    emit(Loading());
    final result = await getHistoricalPrice.execute();
    emit(result.fold((failure) => Error("Error while fetching data"),
        (historicalResponse) => Loaded(historicalResponse)));
  }
}
