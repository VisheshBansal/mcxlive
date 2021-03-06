// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcxliveview/widgets/stock_list.dart';

getCurrentDate() {
  final String date;
  date = DateFormat('MMMM d, y').format(DateTime.now());
  return date;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filteredText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF0B0B19),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "MCX Live",
                      style: TextStyle(
                        color: Color(0xFF36D7B7),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getCurrentDate(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        height: 48,
                        child: TextField(
                          cursorColor: Colors.teal,
                          style: TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            setState(() {
                              filteredText = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: "Search",
                              prefix: Icon(Icons.search,
                                  color: Colors.white, size: 24),
                              fillColor: Color(0xFF151530),
                              filled: true,
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        child: StockList(filteredText: filteredText))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
