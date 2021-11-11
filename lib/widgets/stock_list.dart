import 'package:flutter/material.dart';
import 'package:mcxliveview/models/stock.dart';

class StockList extends StatelessWidget {
  final List<Stock> stocks;

  StockList({required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey[500]);
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
                  Text("L: ${stock.low}  H: ${stock.high}  O: ${stock.open}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12))
                ]),
            trailing: Column(
              children: <Widget>[
                Text("\u{20B9}${stock.ltp}",
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
  }
}
