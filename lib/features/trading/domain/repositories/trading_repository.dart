import 'package:trading_demo_app/features/trading/domain/entities/trade.dart';

abstract class TradingRepository {
  Future<List<Trade>> getTrades();
}
