class Trade {
  const Trade({
    required this.symbol,
    required this.price,
    required this.quantity,
  });

  final String symbol;
  final double price;
  final int quantity;
}
