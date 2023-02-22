import 'package:dartz/dartz.dart';
import 'package:my_package/core/errors/exception.dart';
import 'package:my_package/core/errors/failure.dart';
import 'package:my_package/features/historical_price/data/datasources/historical_price_data_source.dart';
import 'package:my_package/features/historical_price/domain/entities/historical_response.dart';
import 'package:my_package/features/historical_price/domain/repositories/historical_price_repository.dart';

class HistoricalPriceRepositoryImpl implements HistoricalPriceRepository {

  final HistoricalPriceDataSource dataSource;

  HistoricalPriceRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, HistoricalResponse>> getHistoricalPrice() async {
   try {
     final historicalResponse = await dataSource.getHistoricalPrice();
     return Right(historicalResponse);
   } on ServerException {
     return Left(Failure());
   }
  }

}