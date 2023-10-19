// const List<String> currenciesList = [
//   'AUD',
//   'BRL',
//   'CAD',
//   'CNY',
//   'EUR',
//   'GBP',
//   'HKD',
//   'IDR',
//   'ILS',
//   'INR',
//   'JPY',
//   'MXN',
//   'NOK',
//   'NZD',
//   'PLN',
//   'RON',
//   'RUB',
//   'SEK',
//   'SGD',
//   'USD',
//   'ZAR'
// ];

import 'dart:io';
import 'dart:math';
import 'dart:developer' as developer;

import 'package:cryptoeed/network.dart';

class CoinData {
  // int index;
  // CoinData();
  // CoinData({ this.index=0});

  final List<String> cryptoList = [
    'BTC',
    'ETH',
    'DOGE'
        'LTC',
    'USDT',
    'BNB',
    'XRP',
  ];

  final List<String> cryptoName = [
    'Bitcoin',
    'Ethereum',
    'DogeCoin',
    'Litecoin',
    'Tether USDt',
    'BNB',
    'XRP'
  ];

  String getCryptoSymbol(int index) => cryptoList[index];
  String getCryptoName(int index) => cryptoName[index];
  int totalAvailableCrypto() => min(cryptoList.length, cryptoName.length);

  Future<int> getCryptoValue(int index) async {
    var data = await getData(index);
    print(data);
    var rate = data['rate'].toInt();
    // rate = data['rate'].toInt();
    return rate;
  }

  

  Future getData(int index) async {
    final cryptoType = cryptoList[index];
    final currencyType = 'INR';
    String apikey = 'E19741AD-12B5-49A4-93F2-93E9E3F2B2B0';
    String coinAPI =
        'https://rest.coinapi.io/v1/exchangerate/$cryptoType/$currencyType?apikey=$apikey';

    NetworkHelper networkHelper = await NetworkHelper(url: coinAPI);
    var data = await networkHelper.getData();
    if (isDataOkay(data)) {
      return data;
    } else {
      data = await getData(index);
    }
    return data;
  }

  

  bool isDataOkay(var data) {
    if (data == 'Error'||data==null) {
      print('error');
      return false;
    }
    return true;
  }
}
