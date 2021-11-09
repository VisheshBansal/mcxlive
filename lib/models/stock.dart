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

const jsonData =
    '[{"Exchange":"MCX","Symbol":"GOLD","Ser/Exp":"03DEC2021","Last Traded Price":"48209","Buy Price":"48209","Sell Price":"48217","High":"48270","Low":"47976","Open":"48015","Close":"48018","Last Update Time":"07:59:10 PM 09/11/2021","Net Change In Rs":"191","TBQ":"525","TSQ":"396","OI":"7625","% Net Change In Rs":"0.40","DPR":"46578 - 49458","Vol":"4.435","ATP":"48117.20","Code":"226469"},{"Exchange":"MCX","Symbol":"GOLDM","Ser/Exp":"03DEC2021","Last Traded Price":"48199","Buy Price":"48190","Sell Price":"48199","High":"48245","Low":"47981","Open":"48034","Close":"48025","Last Update Time":"07:59:10 PM 09/11/2021","Net Change In Rs":"174","TBQ":"1617","TSQ":"1405","OI":"15675","% Net Change In Rs":"0.36","DPR":"46585 - 49465","Vol":"9.128","ATP":"48126.10","Code":"233000"},{"Exchange":"MCX","Symbol":"SILVER","Ser/Exp":"03DEC2021","Last Traded Price":"64922","Buy Price":"64904","Sell Price":"64918","High":"65080","Low":"64643","Open":"64877","Close":"64881","Last Update Time":"07:59:11 PM 09/11/2021","Net Change In Rs":"41","TBQ":"486","TSQ":"536","OI":"9536","% Net Change In Rs":"0.06","DPR":"62286 - 67476","Vol":"6.340","ATP":"64895.62","Code":"226471"},{"Exchange":"MCX","Symbol":"SILVERM","Ser/Exp":"30NOV2021","Last Traded Price":"65096","Buy Price":"65085","Sell Price":"65094","High":"65240","Low":"64831","Open":"65010","Close":"65027","Last Update Time":"07:59:11 PM 09/11/2021","Net Change In Rs":"69","TBQ":"1543","TSQ":"2520","OI":"20898","% Net Change In Rs":"0.11","DPR":"62426 - 67628","Vol":"20.950","ATP":"65070.36","Code":"225315"},{"Exchange":"MCX","Symbol":"CRUDEOIL","Ser/Exp":"18NOV2021","Last Traded Price":"6120","Buy Price":"6120","Sell Price":"6121","High":"6136","Low":"6053","Open":"6053","Close":"6058","Last Update Time":"07:59:11 PM 09/11/2021","Net Change In Rs":"62","TBQ":"1494","TSQ":"795","OI":"6478","% Net Change In Rs":"1.02","DPR":"5816 - 6300","Vol":"28.025","ATP":"6096.31","Code":"230024"},{"Exchange":"MCX","Symbol":"COPPER","Ser/Exp":"30NOV2021","Last Traded Price":"737.90","Buy Price":"737.90","Sell Price":"738.00","High":"746.00","Low":"734.35","Open":"737.90","Close":"739.40","Last Update Time":"07:59:10 PM 09/11/2021","Net Change In Rs":"-1.50","TBQ":"467","TSQ":"686","OI":"4955","% Net Change In Rs":"-0.20","DPR":"709.85 - 768.95","Vol":"9.327","ATP":"740.01","Code":"230802"},{"Exchange":"MCX","Symbol":"NICKEL","Ser/Exp":"30NOV2021","Last Traded Price":"1506.60","Buy Price":"1506.00","Sell Price":"1506.80","High":"1519.80","Low":"1502.00","Open":"1508.60","Close":"1508.90","Last Update Time":"07:59:10 PM 09/11/2021","Net Change In Rs":"-2.30","TBQ":"263","TSQ":"332","OI":"1440","% Net Change In Rs":"-0.15","DPR":"1448.60 - 1569.20","Vol":"4.057","ATP":"1510.38","Code":"230822"}]';

// ignore: non_constant_identifier_names
Map<String, dynamic> raw_data = json.decode(jsonData);

Future<List<Stock>> getData(String data) async {
  List<Stock> list;
  final String apiEndpoint = 'http://88.99.61.159:5050';
  final Uri url = Uri.parse(apiEndpoint);
  var res = await http.get(url, headers: tokenData);
  print(res.body);
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    var rest = data["data"] as List;
    print(rest);
    list = rest.map<Stock>((json) => Stock.fromJson(json)).toList();
  }
  return list;
}

class Stock {
  final String symbol;
  final String expdate;
  final double ltp;
  final double high;
  final double low;
  final double open;
  final double close;
  final double change;

  Stock(
      {required this.symbol,
      required this.expdate,
      required this.ltp,
      required this.high,
      required this.low,
      required this.open,
      required this.close,
      required this.change});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
        symbol: json["Symbol"],
        expdate: json["Ser/Exp"],
        ltp: json["Last Traded Price"],
        high: json["High"],
        low: json["Low"],
        open: json["Open"],
        close: json["Close"],
        change: json["Net Change In Rs"]);
  }

  static List<Stock> getAll() {
    List<Stock> stocks = <Stock>[];
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03JAN2021",
        ltp: 48130,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 213.67));
    return stocks;
  }
}
