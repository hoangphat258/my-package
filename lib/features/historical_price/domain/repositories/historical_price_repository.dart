import 'package:dartz/dartz.dart';
import 'package:my_package/core/errors/failure.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';

abstract class HistoricalPriceRepository {
  Future<Either<Failure, HistoricalResponse>> getHistoricalPrice();
}
