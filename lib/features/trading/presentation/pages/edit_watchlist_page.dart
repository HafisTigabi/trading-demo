import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/features/trading/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

class EditWatchlistPage extends StatelessWidget {
  const EditWatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (watchlists, selectedIndex, _) {
            final stocks = watchlists[selectedIndex] ?? [];
            return Scaffold(
              backgroundColor: colors.bg,
              appBar: _buildAppBar(context, colors, textTheme, selectedIndex),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWatchlistDropdown(
                    context,
                    colors,
                    textTheme,
                    selectedIndex,
                  ),
                  _buildSegmentTabs(context, colors, textTheme),
                  _buildListHeader(context, colors, textTheme, stocks.length),
                  Expanded(
                    child: _buildReorderableList(
                      context,
                      colors,
                      textTheme,
                      stocks,
                    ),
                  ),
                  _buildSwipeHint(context, colors, textTheme),
                  _buildBottomActions(context, colors, textTheme),
                ],
              ),
            );
          },
          orElse: () => Scaffold(
            backgroundColor: colors.bg,
            body: Center(
              child: CircularProgressIndicator(color: colors.accent),
            ),
          ),
        );
      },
    );
  }

  // ── App bar ─────────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    int selectedIndex,
  ) {
    return AppBar(
      backgroundColor: colors.bg,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.5),
        child: Container(height: 0.5, color: colors.border),
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.chevron_left_rounded, size: rs(context, 28)),
        color: colors.textPri,
        splashRadius: 20,
      ),
      titleSpacing: 0,
      title: Text(
        'Edit watchlist',
        style: textTheme.headlineMedium?.copyWith(
          color: colors.textPri,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: rs(context, 16)),
          padding: EdgeInsets.symmetric(
            horizontal: rs(context, 10),
            vertical: rs(context, 4),
          ),
          decoration: BoxDecoration(
            color: colors.accentSoft,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colors.accent.withValues(alpha: 0.3),
              width: 0.5,
            ),
          ),
          child: Text(
            'WL ${_watchlistLabel(selectedIndex)}',
            style: textTheme.labelSmall?.copyWith(
              color: colors.accentText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ── Watchlist dropdown ───────────────────────────────────────────────────────
  Widget _buildWatchlistDropdown(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    int selectedIndex,
  ) {
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
            style: textTheme.labelSmall?.copyWith(
              color: colors.textSec,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 7),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.border, width: 0.5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedIndex,
                isExpanded: true,
                dropdownColor: colors.surface,
                borderRadius: BorderRadius.circular(12),
                style: textTheme.bodyMedium?.copyWith(color: colors.textPri),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: colors.textSec,
                  size: rs(context, 22),
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
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.textPri,
                        ),
                      ),
                      Text(
                        '6 instruments · NSE',
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.textSec,
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
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.textPri,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      'Watchlist 5',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.textPri,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      'Watchlist 6',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.textPri,
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
  Widget _buildSegmentTabs(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
  ) {
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
        separatorBuilder: (_, _) => SizedBox(width: rs(context, 7)),
        itemBuilder: (context, index) {
          final isActive = index == 0;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: rs(context, 14)),
            decoration: BoxDecoration(
              color: isActive ? colors.accentSoft : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive
                    ? colors.accent.withValues(alpha: 0.3)
                    : colors.border,
                width: 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              tabs[index],
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: isActive ? colors.accentText : colors.textSec,
              ),
            ),
          );
        },
      ),
    );
  }

  // ── List header ──────────────────────────────────────────────────────────────
  Widget _buildListHeader(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    int count,
  ) {
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
            style: textTheme.labelSmall?.copyWith(
              color: colors.textSec,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '$count / 50',
            style: textTheme.labelMedium?.copyWith(color: colors.textSec),
          ),
        ],
      ),
    );
  }

  // ── Reorderable list ─────────────────────────────────────────────────────────
  Widget _buildReorderableList(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    List stocks,
  ) {
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
          return _buildSwipableStockTile(
            context,
            colors,
            textTheme,
            stock,
            index,
          );
        },
      ),
    );
  }

  // ── Swipable stock tile ──────────────────────────────────────────────────────
  Widget _buildSwipableStockTile(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    dynamic stock,
    int index,
  ) {
    return Dismissible(
      key: ValueKey(stock.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        return await _showDeleteConfirm(context, colors, textTheme, stock.name);
      },
      onDismissed: (_) {
        context.read<WatchlistBloc>().add(
          WatchlistEvent.deleteStock(id: stock.id),
        );
      },
      background: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: colors.loss.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colors.loss.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: rs(context, 22)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline_rounded,
              color: colors.loss,
              size: rs(context, 26),
            ),
            const SizedBox(height: 3),
            Text(
              'Remove',
              style: textTheme.labelSmall?.copyWith(
                color: colors.loss,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      child: _buildStockTile(context, colors, textTheme, stock, index),
    );
  }

  // ── Stock tile ───────────────────────────────────────────────────────────────
  Widget _buildStockTile(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    dynamic stock,
    int index,
  ) {
    final iconStyles = [
      (colors.accentSoft, colors.accentText),
      (colors.gainBg, colors.gain),
      (colors.amberBg, colors.amber),
      (colors.purpleBg, colors.purple),
      (colors.lossBg, colors.loss),
    ];
    final (iconBg, iconFg) = iconStyles[index % iconStyles.length];
    final initials = stock.name.length >= 2
        ? stock.name.substring(0, 2).toUpperCase()
        : stock.name.toUpperCase();

    final isPositive = index % 3 != 2;
    final changeColor = isPositive ? colors.gain : colors.loss;
    final changeBg = isPositive ? colors.gainBg : colors.lossBg;
    final changeText = isPositive ? '+1.24%' : '−0.43%';

    return Container(
      key: ValueKey('tile_${stock.id}'),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border, width: 0.5),
      ),
      child: Row(
        children: [
          // ── Drag handle
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: rs(context, 12),
              vertical: rs(context, 18),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3,
                (_) => Container(
                  margin: EdgeInsets.only(bottom: rs(context, 4)),
                  width: rs(context, 18),
                  height: rs(context, 2),
                  decoration: BoxDecoration(
                    color: colors.borderLight,
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
              style: textTheme.titleSmall?.copyWith(
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
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colors.textPri,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    stock.name,
                    style: textTheme.bodySmall?.copyWith(color: colors.textSec),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      _pill(
                        'NSE',
                        colors.accentSoft,
                        colors.accentText,
                        context,
                        textTheme,
                      ),
                      const SizedBox(width: 5),
                      _pill(
                        'EQ',
                        colors.surfaceHigh,
                        colors.textSec,
                        context,
                        textTheme,
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
                  '₹2,847.50',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.textPri,
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
                    style: textTheme.labelSmall?.copyWith(
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
  Widget _pill(
    String label,
    Color bg,
    Color fg,
    BuildContext context,
    TextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          fontSize: rs(context, 10),
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }

  // ── Swipe hint ───────────────────────────────────────────────────────────────
  Widget _buildSwipeHint(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.swipe_left_rounded,
            size: rs(context, 14),
            color: colors.textMuted,
          ),
          const SizedBox(width: 5),
          Text(
            'Swipe left to remove',
            style: textTheme.bodySmall?.copyWith(color: colors.textMuted),
          ),
        ],
      ),
    );
  }

  // ── Delete confirm dialog ────────────────────────────────────────────────────
  Future<bool?> _showDeleteConfirm(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
    String stockName,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: colors.border, width: 0.5),
        ),
        title: Text(
          'Remove stock',
          style: textTheme.headlineSmall?.copyWith(
            color: colors.textPri,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Remove $stockName from this watchlist?',
          style: textTheme.bodyMedium?.copyWith(color: colors.textSec),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('Cancel', style: TextStyle(color: colors.textSec)),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Remove',
              style: TextStyle(color: colors.loss, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom actions ───────────────────────────────────────────────────────────
  Widget _buildBottomActions(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
  ) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(
        rs(context, 16),
        rs(context, 12),
        rs(context, 16),
        rs(context, 12) + bottomInset,
      ),
      decoration: BoxDecoration(
        color: colors.bg,
        border: Border(top: BorderSide(color: colors.border, width: 0.5)),
      ),
      child: Row(
        children: [
          // ── Secondary button (same feel as watchlist controls)
          Expanded(
            child: SizedBox(
              height: rs(context, 46),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: colors.border, width: 1),
                  foregroundColor: colors.textSec,
                  backgroundColor: colors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Manage',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textSec,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // ── Primary button (MATCH watchlist green style)
          Expanded(
            flex: 2,
            child: SizedBox(
              height: rs(context, 46),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Changes saved',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.textPri,
                        ),
                      ),
                      backgroundColor:
                          colors.surfaceHigh, // matches WatchlistPage style
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(rs(context, 12)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(rs(context, 12)),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.gain,
                  foregroundColor: colors.textPri,
                  elevation: 0,
                  shadowColor: colors.gain.withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save changes',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
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
