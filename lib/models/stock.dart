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
      {this.symbol = "G",
      this.expdate = "03DEC2021",
      this.ltp = 48230,
      this.high = 48230,
      this.low = 48230,
      this.open = 48230,
      this.close = 48230,
      this.change = 212});

  static List<Stock> getAll() {
    List<Stock> stocks = <Stock>[];
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));
    stocks.add(Stock(
        symbol: "Gold",
        expdate: "03DEC2021",
        ltp: 48230,
        high: 48270,
        low: 47976,
        open: 48015,
        close: 48018,
        change: 212));

    return stocks;
  }
}
