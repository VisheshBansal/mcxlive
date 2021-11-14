// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mcxliveview/models/stock.dart';
import 'package:intl/intl.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key}) : super(key: key);

  //final List<Stock> stocks;

  //StockList({required this.stocks});

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  late Future<Stock> futureStocks;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    futureStocks = getData();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      futureStocks = getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Stock>(
        future: futureStocks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey[500]);
                },
                itemCount: snapshot.data?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final stock = snapshot.data!.data![index];

                  Color getColor(String? itemval, perVal) {
                    String day = DateFormat('EEEE').format(DateTime.now());
                    if ((itemval != null) &&
                        (day != "Saturday" && day != "Sunday")) {
                      perVal = perVal.replaceAll('%', "");
                      perVal = double.parse(perVal);
                      if (itemval.startsWith('+') || perVal > 0) {
                        return Color(0xFF32CD32);
                      }
                      if (itemval.startsWith('-')) {
                        return Colors.red;
                      } else {
                        return Colors.yellow;
                      }
                    }
                    return Colors.yellow;
                  }

                  return ListTile(
                    contentPadding: EdgeInsets.all(6),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("${stock.symbol}",
                              style: TextStyle(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text("${stock.lastTradedPrice}",
                                style: TextStyle(
                                    color: getColor(
                                        stock.netChangeInRs, stock.perChange),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("L: ${stock.low}  H: ${stock.high}",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12)),
                          ),
                          Text("O: ${stock.open}  C: ${stock.close}",
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                        ]),
                    trailing: Column(
                      children: <Widget>[
                        if (stock.buyPrice != "")
                          Text("${stock.buyPrice} | ${stock.sellPrice}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 0),
                          child: Text(
                              "${stock.netChangeInRs}  (${stock.perChange}%)",
                              style: TextStyle(
                                  color: getColor(
                                      stock.netChangeInRs, stock.perChange),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14)),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                    )));
          }
        });
  }
}
