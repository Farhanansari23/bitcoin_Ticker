//2. Import the required packages.
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'USD',
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

  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '76737DBF-5DEA-4B6A-9F68-A60485270D12';

class CoinData {

  Future getCoinData(currency) async {


    Map<String , dynamic> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String cryptoURL = '$coinAPIURL/$crypto/$currency?apikey=$apiKey';
      http.Response response2 =  await http.get(Uri.parse(cryptoURL));
      if (response2.statusCode == 200){
        var decodedData2 = jsonDecode(response2.body);
        var name = decodedData2['asset_id_base'];
        var rate = decodedData2['rate'];
        cryptoPrices[name] = rate;

      }
    }
    return cryptoPrices;


  }
}
