import 'package:get_it/get_it.dart';
import 'package:my_package/features/historical_price/data/datasources/historical_price_data_source.dart';
import 'package:my_package/features/historical_price/data/repositories/historical_price_repository_impl.dart';
import 'package:my_package/features/historical_price/domain/repositories/historical_price_repository.dart';
import 'package:my_package/features/historical_price/domain/usecases/get_historical_price.dart';
import 'package:my_package/features/historical_price/presentation/bloc/historical_price_bloc.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => HistoricalPriceBloc(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetHistoricalPrice(serviceLocator()));
  serviceLocator.registerLazySingleton<HistoricalPriceRepository>(
          () => HistoricalPriceRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<HistoricalPriceDataSource>(
          () => HistoricalPriceDataSourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => http.Client());
}
