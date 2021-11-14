import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mcxliveview/models/stock.dart';

class StockList extends StatefulWidget {
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
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
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
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("${stock.symbol}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)),
                          Text(
                              "L: ${stock.low}  H: ${stock.high}  O: ${stock.open}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12))
                        ]),
                    trailing: Column(
                      children: <Widget>[
                        Text("\u{20B9}${stock.lastTradedPrice}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text("${stock.change}",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(
                child: Container(
                    height: 50, width: 50, child: CircularProgressIndicator()));
          }
        });
  }
}
