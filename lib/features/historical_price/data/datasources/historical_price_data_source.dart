import 'dart:convert';

import '../../../../core/errors/exception.dart';
import '../models/historical_response_model.dart';
import 'package:http/http.dart' as http;

abstract class HistoricalPriceDataSource {
  Future<HistoricalResponseModel> getHistoricalPrice();
}

class HistoricalPriceDataSourceImpl with HistoricalPriceDataSource {
  final http.Client client;

  HistoricalPriceDataSourceImpl(this.client);

  @override
  Future<HistoricalResponseModel> getHistoricalPrice() async {
    const url =
        "https://financialmodelingprep.com/api/v3/historical-price-full/AAPL?apikey=972a40ec3fd15d05e91131e1feb80be2";
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return HistoricalResponseModel.fromJson(jsonDecode(response.body));
    }
    throw ServerException();
  }
}
