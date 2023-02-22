import 'package:equatable/equatable.dart';
import 'package:my_package/features/historical_price/domain/entities/historical.dart';

class HistoricalResponse extends Equatable {
  const HistoricalResponse({this.symbol, this.historical = const []});

  final String? symbol;
  final List<Historical> historical;

  @override
  List<Object?> get props => [symbol, historical];
}
