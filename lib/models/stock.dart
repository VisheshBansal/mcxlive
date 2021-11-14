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

Future<Stock> getData() async {
  Stock list;
  const String apiEndpoint = 'http://88.99.61.159:5050/getdata';
  final Uri url = Uri.parse(apiEndpoint);
  var res = await http.get(url, headers: tokenData);
  if (res.statusCode == 200) {
    var data = json.decode(res.body);
    list = Stock.fromJson(data);
    //var rest = data["data"] as List;
    //list = rest.map<Stock>((json) => Stock.fromJson(json)).toList();
  } else {
    throw ("Error: ${res.statusCode}");
  }
  return (list);
}

class Stock {
  List<Data>? data;

  Stock({this.data});

  Stock.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? exchange;
  String? symbol;
  String? serExp;
  String? lastTradedPrice;
  String? buyPrice;
  String? sellPrice;
  String? high;
  String? low;
  String? open;
  String? close;
  String? lastUpdateTime;
  String? netChangeInRs;
  String? totalBuyQty;
  String? totalSellQty;
  String? openInterest;
  String? perChange;
  String? dPR;
  String? volumeIn000s;
  String? avgTradedPrice;
  String? code;

  Data(
      {this.exchange,
      this.symbol,
      this.serExp,
      this.lastTradedPrice,
      this.buyPrice,
      this.sellPrice,
      this.high,
      this.low,
      this.open,
      this.close,
      this.lastUpdateTime,
      this.netChangeInRs,
      this.totalBuyQty,
      this.totalSellQty,
      this.openInterest,
      this.perChange,
      this.dPR,
      this.volumeIn000s,
      this.avgTradedPrice,
      this.code});

  Data.fromJson(Map<String, dynamic> json) {
    exchange = json['Exchange'];
    symbol = json['Symbol'];
    serExp = json['Ser/Exp'];
    lastTradedPrice = json['Last Traded Price'];
    buyPrice = json['Buy Price'];
    sellPrice = json['Sell Price'];
    high = json['High'];
    low = json['Low'];
    open = json['Open'];
    close = json['Close'];
    lastUpdateTime = json['Last Update Time'];
    netChangeInRs = json['Net Change In Rs'];
    totalBuyQty = json['Total Buy Qty'];
    totalSellQty = json['Total Sell Qty'];
    openInterest = json['Open Interest'];
    perChange = json['% Change'];
    dPR = json['DPR'];
    volumeIn000s = json['Volume (in 000s)'];
    avgTradedPrice = json['Avg. Traded Price'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Exchange'] = exchange;
    data['Symbol'] = symbol;
    data['Ser/Exp'] = serExp;
    data['Last Traded Price'] = lastTradedPrice;
    data['Buy Price'] = buyPrice;
    data['Sell Price'] = sellPrice;
    data['High'] = high;
    data['Low'] = low;
    data['Open'] = open;
    data['Close'] = close;
    data['Last Update Time'] = lastUpdateTime;
    data['Net Change In Rs'] = netChangeInRs;
    data['Total Buy Qty'] = totalBuyQty;
    data['Total Sell Qty'] = totalSellQty;
    data['Open Interest'] = openInterest;
    data['% Change'] = perChange;
    data['DPR'] = dPR;
    data['Volume (in 000s)'] = volumeIn000s;
    data['Avg. Traded Price'] = avgTradedPrice;
    data['Code'] = code;
    return data;
  }
}
