import 'dart:convert';

import 'package:bitcoin_ticker/api.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const baseURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = kApiKey;

class CoinData {
  Future getCoinData() async {
    const requestURL = '$baseURL/BTC/USD?apiKey=$apiKey';
    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var price = decodedData['rate'];
      return price;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }
}
