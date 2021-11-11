import 'dart:core';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

final Map<String, String> tokenData = {
  'Connection': 'keep-alive',
  'Accept': 'application/json, text/plain, */*',
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36',
  'Origin': 'http://88.99.61.159:4100',
  'Referer': 'http://88.99.61.159:4100/',
  'Accept-Encoding': 'gzip, deflate',
  'Accept-Language': 'en-US,en;q=0.9,en-GB;q=0.8,hi;q=0.7',
  'If-None-Match': 'W/"35f6-lbZAd6vCBUugPaqRPtDi0w"'
};

Future<List<Stock>> getData(String data) async {
  List<Stock> list;
  final String apiEndpoint = 'http://88.99.61.159:5050/getdata';
  final Uri url = Uri.parse(apiEndpoint);
  var res = await http.get(url, headers: tokenData);
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"] as List;
    list = rest.map<Stock>((json) => Stock.fromJson(json)).toList();
  } else {
    throw ("Error: ${res.statusCode}");
  }
  print(list);
  return (list);
}

class Stock {
  final String symbol;
  final String expdate;
  final String ltp;
  final String buy;
  final String sell;
  final String high;
  final String low;
  final String open;
  final String close;
  final String change;

  Stock(
      {required this.symbol,
      required this.expdate,
      required this.ltp,
      required this.buy,
      required this.sell,
      required this.high,
      required this.low,
      required this.open,
      required this.close,
      required this.change});

  factory Stock.fromJson(json) {
    return Stock(
        symbol: json["Symbol"],
        expdate: json["Ser/Exp"],
        ltp: json["Last Traded Price"],
        buy: json["Buy Price"],
        sell: json["Sell Price"],
        high: json["High"],
        low: json["Low"],
        open: json["Open"],
        close: json["Close"],
        change: json["Net Change In Rs"]);
  }

  static List<Stock> getAll() {
    List<Stock> stocks = <Stock>[];
    var json = getData('lol');
    stocks.add(Stock.fromJson(json));

    return stocks;
  }
}
