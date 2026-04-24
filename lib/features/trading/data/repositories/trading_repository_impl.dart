import 'package:trading_demo_app/features/trading/data/datasources/trading_remote_data_source.dart';
import 'package:trading_demo_app/features/trading/domain/entities/trade.dart';
import 'package:trading_demo_app/features/trading/domain/repositories/trading_repository.dart';

class TradingRepositoryImpl implements TradingRepository {
  const TradingRepositoryImpl(this._remoteDataSource);

  final TradingRemoteDataSource _remoteDataSource;

  @override
  Future<List<Trade>> getTrades() {
    return _remoteDataSource.getTrades();
  }
}
