import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trading_demo_app/features/trading/data/models/stock_model.dart';
import 'package:trading_demo_app/shared/helper/watchlist1_data.dart';
import 'package:trading_demo_app/shared/helper/watchlist5_data.dart';
import 'package:trading_demo_app/shared/helper/watchlist6_data.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';
part 'watchlist_bloc.freezed.dart';

enum WatchlistSortType { none, priceHighToLow, priceLowToHigh, changeHighToLow, az }

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(const WatchlistState.initial()) {
    on<_LoadWatchlist>(_onLoadWatchlist);
    on<_ChangeWatchlist>(_onChangeWatchlist);
    on<_ReorderStocks>(_onReorderStocks);
    on<_DeleteStock>(_onDeleteStock);
    on<_ChangeSortType>(_onChangeSortType);
  }

  Future<void> _onLoadWatchlist(
    _LoadWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(const WatchlistState.loading());
    try {
      emit(
        WatchlistState.loaded(
          watchlists: {
            0: List<StockModel>.unmodifiable(watchlist1Data),
            1: List<StockModel>.unmodifiable(watchlist5Data),
            2: List<StockModel>.unmodifiable(watchlist6Data),
          },
          selectedIndex: 0,
          sortType: WatchlistSortType.none,
        ),
      );
    } catch (_) {
      emit(const WatchlistState.error('Failed to load watchlist'));
    }
  }

  void _onChangeWatchlist(
    _ChangeWatchlist event,
    Emitter<WatchlistState> emit,
  ) {
    final currentState = state;
    if (currentState is! _Loaded) return;

    emit(currentState.copyWith(selectedIndex: event.index));
  }

  void _onReorderStocks(
    _ReorderStocks event,
    Emitter<WatchlistState> emit,
  ) {
    final currentState = state;
    if (currentState is! _Loaded) return;

    final watchlists = Map<int, List<StockModel>>.from(currentState.watchlists);
    final currentList = watchlists[currentState.selectedIndex];
    if (currentList == null) return;

    if (event.oldIndex < 0 || event.oldIndex >= currentList.length) return;
    if (event.newIndex < 0 || event.newIndex > currentList.length) return;

    final reordered = List<StockModel>.from(currentList);
    var targetIndex = event.newIndex;
    if (targetIndex > event.oldIndex) {
      targetIndex -= 1;
    }

    final movedItem = reordered.removeAt(event.oldIndex);
    reordered.insert(targetIndex, movedItem);

    watchlists[currentState.selectedIndex] = List<StockModel>.unmodifiable(reordered);

    emit(currentState.copyWith(watchlists: watchlists));
  }

  void _onDeleteStock(
    _DeleteStock event,
    Emitter<WatchlistState> emit,
  ) {
    final currentState = state;
    if (currentState is! _Loaded) return;

    final watchlists = Map<int, List<StockModel>>.from(currentState.watchlists);
    final currentList = watchlists[currentState.selectedIndex];
    if (currentList == null) return;

    final filtered = currentList
        .where((stock) => stock.id != event.id)
        .toList(growable: false);

    watchlists[currentState.selectedIndex] = List<StockModel>.unmodifiable(filtered);

    emit(currentState.copyWith(watchlists: watchlists));
  }

  void _onChangeSortType(
    _ChangeSortType event,
    Emitter<WatchlistState> emit,
  ) {
    final currentState = state;
    if (currentState is! _Loaded) return;

    emit(currentState.copyWith(sortType: event.sortType));
  }
}
