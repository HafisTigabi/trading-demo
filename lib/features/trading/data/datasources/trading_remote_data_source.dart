import 'package:trading_demo_app/features/trading/data/models/trade_model.dart';

abstract class TradingRemoteDataSource {
  Future<List<TradeModel>> getTrades();
}

class TradingRemoteDataSourceImpl implements TradingRemoteDataSource {
  @override
  Future<List<TradeModel>> getTrades() async {
    return const [
      TradeModel(symbol: 'AAPL', price: 185.42, quantity: 10),
      TradeModel(symbol: 'TSLA', price: 174.03, quantity: 7),
      TradeModel(symbol: 'NVDA', price: 902.11, quantity: 3),
    ];
  }
}
