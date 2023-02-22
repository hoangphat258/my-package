import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_package/core/errors/exception.dart';
import 'package:my_package/features/historical_price/data/datasources/historical_price_data_source.dart';
import 'package:my_package/features/historical_price/data/models/historical_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'historical_price_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockHttpClient;
  late HistoricalPriceDataSourceImpl dataSource;
  const url =
      'https://financialmodelingprep.com/api/v3/historical-price-full/AAPL?apikey=972a40ec3fd15d05e91131e1feb80be2';

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = HistoricalPriceDataSourceImpl(mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('historical_response.json'), 200));
  }

  void setUpMockHttpClientFailure() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 400));
  }

  test('should perform a GET request on a URL with application/json header',
      () {
    setUpMockHttpClientSuccess200();
    dataSource.getHistoricalPrice();
    verify(mockHttpClient
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'}));
  });

  test('should return HistoricalResponse when the response code is 200',
      () async {
    final tHistoricalResponseModel = HistoricalResponseModel.fromJson(
        jsonDecode(fixture('historical_response.json')));
    setUpMockHttpClientSuccess200();
    final result = await dataSource.getHistoricalPrice();
    expect(result, tHistoricalResponseModel);
  });

  test('should throw ServerException', () async {
    setUpMockHttpClientFailure();
    final call = dataSource.getHistoricalPrice;
    expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
  });
}
