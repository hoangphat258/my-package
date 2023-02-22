import 'package:equatable/equatable.dart';

abstract class HistoricalPriceEvent extends Equatable {}

class GetHistoricalPriceEvent extends HistoricalPriceEvent {
  @override
  List<Object?> get props => [];
}