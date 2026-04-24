part of 'watchlist_bloc.dart';

@freezed
class WatchlistEvent with _$WatchlistEvent {
  const factory WatchlistEvent.loadWatchlist() = _LoadWatchlist;
  const factory WatchlistEvent.changeWatchlist({required int index}) =
      _ChangeWatchlist;
  const factory WatchlistEvent.reorderStocks({
    required int oldIndex,
    required int newIndex,
  }) = _ReorderStocks;
  const factory WatchlistEvent.deleteStock({required String id}) = _DeleteStock;
  const factory WatchlistEvent.changeSortType({
    required WatchlistSortType sortType,
  }) = _ChangeSortType;
}
