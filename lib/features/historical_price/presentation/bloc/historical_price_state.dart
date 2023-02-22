import 'package:equatable/equatable.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';

abstract class HistoricalPriceState extends Equatable {}

class Empty extends HistoricalPriceState {
  @override
  List<Object?> get props => [];
}

class Loading extends HistoricalPriceState {
  @override
  List<Object?> get props => [];
}

class Loaded extends HistoricalPriceState {
  final HistoricalResponse historicalResponse;

  Loaded(this.historicalResponse);

  @override
  List<Object?> get props => [historicalResponse];
}

class Error extends HistoricalPriceState {
  final String message;

  Error(this.message);

  @override
  List<Object?> get props => [message];
}
