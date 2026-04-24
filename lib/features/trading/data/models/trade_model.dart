import 'package:trading_demo_app/features/trading/domain/entities/trade.dart';

class TradeModel extends Trade {
  const TradeModel({
    required super.symbol,
    required super.price,
    required super.quantity,
  });

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'price': price,
      'quantity': quantity,
    };
  }
}
