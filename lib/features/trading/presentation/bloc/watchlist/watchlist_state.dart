part of 'watchlist_bloc.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = _Initial;
  const factory WatchlistState.loading() = _Loading;
  const factory WatchlistState.loaded({
    required Map<int, List<StockModel>> watchlists,
    required int selectedIndex,
    required WatchlistSortType sortType,
  }) = _Loaded;
  const factory WatchlistState.error(String message) = _Error;
}
