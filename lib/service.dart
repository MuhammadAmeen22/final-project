import 'dart:convert';

import 'package:untitled3/coinModel.dart';

import 'models/currencyModel.dart';
import 'package:http/http.dart' as http;


class Services{

  String url = "https://api.currencyapi.com/v3/latest?apikey=cur_live_XbnpKltjYUduxqcr74XBjO5Ikmp1ZnjjON3uGk4O";
  var listTemp =[];

   Future<List> getCurrencies () async{
    final response = await http.get(Uri.parse(url));
   var list=[];

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON response
      final dynamic data = json.decode(response.body);

      // Check if the 'rates' key is present and has a value
      if (data != null && data['data'] != null) {
        Map<String, dynamic> rates = data['data'];
        rates.forEach((currency, rate) {
          print('${'Code: '+ rate['code']}, Rate: ${rate['value']}');
          list.add(rate);

        });
        print('${list.length}');

        return list;
      } else {
        print('Error: Invalid response format');
        throw Exception('');
      }
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('');

    }
  }







  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }

      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }




}