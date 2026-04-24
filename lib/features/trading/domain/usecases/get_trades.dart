import 'package:trading_demo_app/features/trading/domain/entities/trade.dart';
import 'package:trading_demo_app/features/trading/domain/repositories/trading_repository.dart';

class GetTrades {
  const GetTrades(this._repository);

  final TradingRepository _repository;

  Future<List<Trade>> call() {
    return _repository.getTrades();
  }
}
