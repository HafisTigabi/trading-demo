import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_demo_app/features/trading/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

class EditWatchlistPage extends StatelessWidget {
  const EditWatchlistPage({super.key});

  static const _bg = Color(0xFF0B0E11);
  static const _surface = Color(0xFF161B23);
  static const _border = Color(0xFF2A3245);
  static const _textPri = Color(0xFFE8EBF0);
  static const _textSec = Color(0xFF5A6475);
  static const _accent = Color(0xFF1A6BDB);
  static const _accentSoft = Color(0xFF1A2540);
  static const _accentText = Color(0xFF4E94E6);
  static const _green = Color(0xFF27AE74);
  static const _greenBg = Color(0xFF0D2218);
  static const _red = Color(0xFFE24B4A);
  static const _redBg = Color(0xFF200D0D);
  static const _amber = Color(0xFFE29A27);
  static const _amberBg = Color(0xFF201508);
  static const _purple = Color(0xFF9B7FE8);
  static const _purpleBg = Color(0xFF1A1530);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (watchlists, selectedIndex, _) {
            final stocks = watchlists[selectedIndex] ?? [];
            return Theme(
              data: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: _bg,
                canvasColor: _surface,
              ),
              child: Scaffold(
                backgroundColor: _bg,
                appBar: _buildAppBar(context, selectedIndex),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildWatchlistDropdown(context, selectedIndex),
                    _buildSegmentTabs(context),
                    _buildListHeader(context, stocks.length),
                    Expanded(child: _buildReorderableList(context, stocks)),
                    _buildSwipeHint(context),
                    _buildBottomActions(context),
                  ],
                ),
              ),
            );
          },
          orElse: () => const Scaffold(
            backgroundColor: _bg,
            body: Center(child: CircularProgressIndicator(color: _accentText)),
          ),
        );
      },
    );
  }

  // ── App bar — plain back icon, no decoration ────────────────────────────────
  PreferredSizeWidget _buildAppBar(BuildContext context, int selectedIndex) {
    return AppBar(
      backgroundColor: _bg,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Container(height: 0.5, color: _border),
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.chevron_left_rounded, size: 28),
        color: _textPri,
        splashRadius: 20,
      ),
      titleSpacing: 0,
      title: Text(
        'Edit watchlist',
        style: TextStyle(
          color: _textPri,
          fontSize: rs(context, 17),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: _accentSoft,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E3A6E), width: 0.5),
          ),
          child: Text(
            'WL ${_watchlistLabel(selectedIndex)}',
            style: const TextStyle(
              color: _accentText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ── Watchlist dropdown ───────────────────────────────────────────────────────
  Widget _buildWatchlistDropdown(BuildContext context, int selectedIndex) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, 16),
        rs(context, 16),
        rs(context, 16),
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ACTIVE WATCHLIST',
            style: TextStyle(
              fontSize: rs(context, 11),
              color: _textSec,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _border, width: 0.5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedIndex,
                isExpanded: true,
                dropdownColor: _surface,
                borderRadius: BorderRadius.circular(12),
                style: const TextStyle(color: _textPri, fontSize: 15),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: _textSec,
                  size: 22,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: rs(context, 16),
                  vertical: rs(context, 11),
                ),
                selectedItemBuilder: (context) => [0, 1, 2].map((i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Watchlist ${_watchlistLabel(i)}',
                        style: TextStyle(
                          fontSize: rs(context, 15),
                          fontWeight: FontWeight.w600,
                          color: _textPri,
                        ),
                      ),
                      Text(
                        '6 instruments · NSE',
                        style: TextStyle(
                          fontSize: rs(context, 12),
                          color: _textSec,
                        ),
                      ),
                    ],
                  );
                }).toList(),
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text(
                      'Watchlist 1',
                      style: TextStyle(
                        color: _textPri,
                        fontSize: rs(context, 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      'Watchlist 5',
                      style: TextStyle(
                        color: _textPri,
                        fontSize: rs(context, 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      'Watchlist 6',
                      style: TextStyle(
                        color: _textPri,
                        fontSize: rs(context, 15),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.read<WatchlistBloc>().add(
                      WatchlistEvent.changeWatchlist(index: value),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Segment tabs ─────────────────────────────────────────────────────────────
  Widget _buildSegmentTabs(BuildContext context) {
    final tabs = ['All', 'Equity', 'F&O', 'MF'];
    return SizedBox(
      height: rs(context, 52),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: rs(context, 16),
          vertical: rs(context, 11),
        ),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => SizedBox(width: rs(context, 7)),
        itemBuilder: (context, index) {
          final isActive = index == 0;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: rs(context, 14)),
            decoration: BoxDecoration(
              color: isActive ? _accentSoft : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive ? const Color(0xFF1E3A6E) : _border,
                width: 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              tabs[index],
              style: TextStyle(
                fontSize: rs(context, 12),
                fontWeight: FontWeight.w500,
                color: isActive ? _accentText : _textSec,
              ),
            ),
          );
        },
      ),
    );
  }

  // ── List header ──────────────────────────────────────────────────────────────
  Widget _buildListHeader(BuildContext context, int count) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, 16),
        rs(context, 4),
        rs(context, 16),
        rs(context, 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'INSTRUMENTS',
            style: TextStyle(
              fontSize: rs(context, 11),
              color: _textSec,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '$count / 50',
            style: TextStyle(fontSize: rs(context, 12), color: _textSec),
          ),
        ],
      ),
    );
  }

  // ── Reorderable list with swipe-to-delete ────────────────────────────────────
  Widget _buildReorderableList(BuildContext context, List stocks) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: ReorderableListView.builder(
        padding: EdgeInsets.symmetric(horizontal: rs(context, 16)),
        itemCount: stocks.length,
        proxyDecorator: (child, index, animation) =>
            Material(color: Colors.transparent, child: child),
        onReorder: (oldIndex, newIndex) {
          context.read<WatchlistBloc>().add(
            WatchlistEvent.reorderStocks(
              oldIndex: oldIndex,
              newIndex: newIndex,
            ),
          );
        },
        itemBuilder: (context, index) {
          final stock = stocks[index];
          return _buildSwipableStockTile(context, stock, index);
        },
      ),
    );
  }

  // ── Swipable stock tile ──────────────────────────────────────────────────────
  Widget _buildSwipableStockTile(
    BuildContext context,
    dynamic stock,
    int index,
  ) {
    return Dismissible(
      key: ValueKey(stock.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        return await _showDeleteConfirm(context, stock.name);
      },
      onDismissed: (_) {
        context.read<WatchlistBloc>().add(
          WatchlistEvent.deleteStock(id: stock.id),
        );
      },
      // ── Red background revealed on swipe
      background: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF7A1520),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFFF6B6B),
              size: 26,
            ),
            const SizedBox(height: 3),
            Text(
              'Remove',
              style: TextStyle(
                color: const Color(0xFFFF6B6B),
                fontSize: rs(context, 11),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      child: _buildStockTile(context, stock, index),
    );
  }

  // ── Stock tile ───────────────────────────────────────────────────────────────
  Widget _buildStockTile(BuildContext context, dynamic stock, int index) {
    // Color-coded icon by cycling — replace with real segment/type logic
    final iconStyles = [
      (_accentSoft, _accentText),
      (_greenBg, _green),
      (_amberBg, _amber),
      (_purpleBg, _purple),
      (_redBg, _red),
    ];
    final (iconBg, iconFg) = iconStyles[index % iconStyles.length];
    final initials = stock.name.length >= 2
        ? stock.name.substring(0, 2).toUpperCase()
        : stock.name.toUpperCase();

    // Mocked price/change — replace with real model fields
    final isPositive = index % 3 != 2;
    final changeColor = isPositive ? _green : _red;
    final changeBg = isPositive ? _greenBg : _redBg;
    final changeText = isPositive ? '+1.24%' : '−0.43%';

    return Container(
      key: ValueKey('tile_${stock.id}'),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border, width: 0.5),
      ),
      child: Row(
        children: [
          // ── Drag handle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (_) => Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  width: 18,
                  height: 2,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A3245),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),

          // ── Icon
          Container(
            width: rs(context, 42),
            height: rs(context, 42),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: TextStyle(
                fontSize: rs(context, 13),
                fontWeight: FontWeight.w700,
                color: iconFg,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // ── Name + full name + exchange pills
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.name,
                    style: TextStyle(
                      fontSize: rs(context, 15),
                      fontWeight: FontWeight.w700,
                      color: _textPri,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    stock.name,
                    style: TextStyle(
                      fontSize: rs(context, 12),
                      color: _textSec,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      _pill('NSE', _accentSoft, _accentText, context),
                      const SizedBox(width: 5),
                      _pill(
                        'EQ',
                        const Color(0xFF1A2530),
                        const Color(0xFF5A8FB0),
                        context,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── Price + change badge
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹2,847.50', // replace with stock.ltp
                  style: TextStyle(
                    fontSize: rs(context, 15),
                    fontWeight: FontWeight.w700,
                    color: _textPri,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: changeBg,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    changeText,
                    style: TextStyle(
                      fontSize: rs(context, 11),
                      fontWeight: FontWeight.w600,
                      color: changeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Exchange/type pill ───────────────────────────────────────────────────────
  Widget _pill(String label, Color bg, Color fg, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: rs(context, 10),
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }

  // ── Swipe hint ───────────────────────────────────────────────────────────────
  Widget _buildSwipeHint(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.swipe_left_rounded,
            size: 14,
            color: Color(0xFF2A3245),
          ),
          const SizedBox(width: 5),
          Text(
            'Swipe left to remove',
            style: TextStyle(
              fontSize: rs(context, 11),
              color: const Color(0xFF2A3245),
            ),
          ),
        ],
      ),
    );
  }

  // ── Delete confirm dialog ────────────────────────────────────────────────────
  Future<bool?> _showDeleteConfirm(
    BuildContext context,
    String stockName,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161B23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Color(0xFF2A3245), width: 0.5),
        ),
        title: const Text(
          'Remove stock',
          style: TextStyle(
            color: Color(0xFFE8EBF0),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Remove $stockName from this watchlist?',
          style: const TextStyle(color: Color(0xFF5A6475), fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF5A6475)),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text(
              'Remove',
              style: TextStyle(
                color: Color(0xFFE24B4A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom actions ───────────────────────────────────────────────────────────
  Widget _buildBottomActions(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(
        rs(context, 16),
        rs(context, 12),
        rs(context, 16),
        rs(context, 12) + bottomInset,
      ),
      decoration: const BoxDecoration(
        color: _bg,
        border: Border(top: BorderSide(color: _border, width: 0.5)),
      ),
      child: Row(
        children: [
          // ── Secondary button (flex 1)
          Expanded(
            child: SizedBox(
              height: rs(context, 46),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: _border, width: 0.5),
                  foregroundColor: const Color(0xFF8A95A3),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Manage',
                  style: TextStyle(
                    fontSize: rs(context, 13),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // ── Primary button (flex 2)
          Expanded(
            flex: 2,
            child: SizedBox(
              height: rs(context, 46),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save changes',
                  style: TextStyle(
                    fontSize: rs(context, 14),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────
  String _watchlistLabel(int index) {
    const labels = ['1', '5', '6'];
    return index < labels.length ? labels[index] : '1';
  }
}
