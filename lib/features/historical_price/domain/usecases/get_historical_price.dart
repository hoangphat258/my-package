import 'package:dartz/dartz.dart';
import 'package:my_package/core/errors/failure.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';
import 'package:my_package/features/historical_price/domain/repositories/historical_price_repository.dart';

class GetHistoricalPrice {
  final HistoricalPriceRepository repository;

  GetHistoricalPrice(this.repository);

  Future<Either<Failure, HistoricalResponse>> execute() async {
    return await repository.getHistoricalPrice();
  }
}
