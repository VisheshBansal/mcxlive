import 'package:flutter/material.dart';
import 'package:mcxliveview/models/stock.dart';

class StockList extends StatelessWidget {
  final List<Stock> stocks;

  StockList({required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.green);
        },
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          final stock = stocks[index];
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
                  Text("${stock.change}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12))
                ]),
          );
        });
  }
}
