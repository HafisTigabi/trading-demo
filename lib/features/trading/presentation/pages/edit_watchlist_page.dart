import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/core/theme/app_spacing.dart';
import 'package:trading_demo_app/features/trading/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

// ── Constants ────────────────────────────────────────────────────────────────

const _kSegmentTabs = ['All', 'Equity', 'F&O', 'MF'];
const _kWatchlistLabels = ['1', '5', '6'];
const _kWatchlistNames = ['Watchlist 1', 'Watchlist 5', 'Watchlist 6'];

String _watchlistLabel(int index) =>
    index < _kWatchlistLabels.length ? _kWatchlistLabels[index] : '1';

// ── Page ─────────────────────────────────────────────────────────────────────

class EditWatchlistPage extends StatelessWidget {
  const EditWatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (watchlists, selectedIndex, _) {
          final stocks = watchlists[selectedIndex] ?? [];
          return Scaffold(
            backgroundColor: colors.bg,
            appBar: _WatchlistAppBar(
              colors: colors,
              textTheme: textTheme,
              selectedIndex: selectedIndex,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _WatchlistDropdown(
                  colors: colors,
                  textTheme: textTheme,
                  selectedIndex: selectedIndex,
                ),
                _SegmentTabs(colors: colors, textTheme: textTheme),
                _ListHeader(
                  colors: colors,
                  textTheme: textTheme,
                  count: stocks.length,
                ),
                Expanded(
                  child: _ReorderableStockList(
                    colors: colors,
                    textTheme: textTheme,
                    stocks: stocks,
                  ),
                ),
                _SwipeHint(colors: colors, textTheme: textTheme),
                _BottomActions(colors: colors, textTheme: textTheme),
              ],
            ),
          );
        },
        orElse: () => Scaffold(
          backgroundColor: colors.bg,
          body: Center(
            child: CircularProgressIndicator(
              color: colors.gain,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}

// ── App Bar ──────────────────────────────────────────────────────────────────

class _WatchlistAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _WatchlistAppBar({
    required this.colors,
    required this.textTheme,
    required this.selectedIndex,
  });

  final AppColorScheme colors;
  final TextTheme textTheme;
  final int selectedIndex;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.bg,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.chevron_left_rounded,
          size: rs(context, 28),
          color: colors.textPri,
        ),
        splashRadius: 20,
      ),
      titleSpacing: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _GlowDot(color: colors.gain, context: context),
          SizedBox(width: rs(context, 8)),
          Text(
            'Edit Watchlist',
            style: textTheme.headlineLarge?.copyWith(
              color: colors.textPri,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: rs(context, AppSpacing.md)),
          child: _LabelPill(
            label: 'WL ${_watchlistLabel(selectedIndex)}',
            color: colors.gain,
            context: context,
            textTheme: textTheme,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: _GradientDivider(colors: colors),
      ),
    );
  }
}

// ── Watchlist Dropdown ───────────────────────────────────────────────────────

class _WatchlistDropdown extends StatelessWidget {
  const _WatchlistDropdown({
    required this.colors,
    required this.textTheme,
    required this.selectedIndex,
  });

  final AppColorScheme colors;
  final TextTheme textTheme;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, AppSpacing.sm),
        rs(context, AppSpacing.md),
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(
            label: 'ACTIVE WATCHLIST',
            colors: colors,
            textTheme: textTheme,
          ),
          SizedBox(height: rs(context, 7)),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(rs(context, 12)),
              border: Border.all(color: colors.border),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedIndex,
                isExpanded: true,
                dropdownColor: colors.surface,
                borderRadius: BorderRadius.circular(rs(context, 12)),
                style: textTheme.bodyMedium?.copyWith(color: colors.textPri),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: colors.gain,
                  size: rs(context, 22),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: rs(context, AppSpacing.md),
                  vertical: rs(context, 11),
                ),
                // selectedItemBuilder shows richer info in the closed state
                selectedItemBuilder: (_) => List.generate(
                  _kWatchlistNames.length,
                  (i) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _kWatchlistNames[i],
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
                  ),
                ),
                items: List.generate(
                  _kWatchlistNames.length,
                  (i) => DropdownMenuItem(
                    value: i,
                    child: Text(
                      _kWatchlistNames[i],
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.textPri,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
}

// ── Segment Tabs ─────────────────────────────────────────────────────────────

class _SegmentTabs extends StatelessWidget {
  const _SegmentTabs({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: rs(context, AppSpacing.md),
        vertical: rs(context, 8),
      ),
      child: Container(
        height: rs(context, 42),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(rs(context, 10)),
          border: Border.all(color: colors.border),
        ),
        child: Row(
          children: List.generate(
            _kSegmentTabs.length,
            (i) => _SegmentTab(
              label: _kSegmentTabs[i],
              isActive: i == 0,
              colors: colors,
              textTheme: textTheme,
            ),
          ),
        ),
      ),
    );
  }
}

class _SegmentTab extends StatelessWidget {
  const _SegmentTab({
    required this.label,
    required this.isActive,
    required this.colors,
    required this.textTheme,
  });

  final String label;
  final bool isActive;
  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.all(rs(context, 4)),
        decoration: BoxDecoration(
          color: isActive ? colors.gain : Colors.transparent,
          borderRadius: BorderRadius.circular(rs(context, 7)),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: colors.gain.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: isActive ? colors.textPri : colors.textSec,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ── List Header ──────────────────────────────────────────────────────────────

class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.colors,
    required this.textTheme,
    required this.count,
  });

  final AppColorScheme colors;
  final TextTheme textTheme;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, 4),
        rs(context, AppSpacing.md),
        rs(context, 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SectionLabel(
            label: 'INSTRUMENTS',
            colors: colors,
            textTheme: textTheme,
          ),
          _LabelPill(
            label: '$count / 50',
            color: colors.gain,
            context: context,
            textTheme: textTheme,
          ),
        ],
      ),
    );
  }
}

// ── Reorderable Stock List ───────────────────────────────────────────────────

class _ReorderableStockList extends StatelessWidget {
  const _ReorderableStockList({
    required this.colors,
    required this.textTheme,
    required this.stocks,
  });

  final AppColorScheme colors;
  final TextTheme textTheme;
  final List stocks;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      padding: EdgeInsets.symmetric(horizontal: rs(context, AppSpacing.md)),
      itemCount: stocks.length,
      // Transparent proxy — no extra Theme wrapper needed
      proxyDecorator: (child, _, __) =>
          Material(color: Colors.transparent, child: child),
      onReorder: (oldIndex, newIndex) {
        context.read<WatchlistBloc>().add(
          WatchlistEvent.reorderStocks(oldIndex: oldIndex, newIndex: newIndex),
        );
      },
      itemBuilder: (context, index) => _SwipableStockTile(
        key: ValueKey(stocks[index].id),
        colors: colors,
        textTheme: textTheme,
        stock: stocks[index],
        index: index,
      ),
    );
  }
}

// ── Swipable Stock Tile ──────────────────────────────────────────────────────

class _SwipableStockTile extends StatelessWidget {
  const _SwipableStockTile({
    super.key,
    required this.colors,
    required this.textTheme,
    required this.stock,
    required this.index,
  });

  final AppColorScheme colors;
  final TextTheme textTheme;
  final dynamic stock;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(stock.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _showDeleteConfirm(context),
      onDismissed: (_) {
        context.read<WatchlistBloc>().add(
          WatchlistEvent.deleteStock(id: stock.id),
        );
      },
      background: _DismissBackground(colors: colors, textTheme: textTheme),
      child: _StockTile(
        colors: colors,
        textTheme: textTheme,
        stock: stock,
        index: index,
      ),
    );
  }

  Future<bool?> _showDeleteConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rs(context, 14)),
          side: BorderSide(color: colors.border),
        ),
        title: Text(
          'Remove stock',
          style: textTheme.headlineSmall?.copyWith(
            color: colors.textPri,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Remove ${stock.name} from this watchlist?',
          style: textTheme.bodyMedium?.copyWith(color: colors.textSec),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              'Cancel',
              style: textTheme.labelMedium?.copyWith(color: colors.textSec),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Remove',
              style: textTheme.labelMedium?.copyWith(
                color: colors.loss,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Dismiss Background ───────────────────────────────────────────────────────

class _DismissBackground extends StatelessWidget {
  const _DismissBackground({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: rs(context, 8)),
      decoration: BoxDecoration(
        color: colors.loss.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(rs(context, 12)),
        border: Border.all(color: colors.loss.withValues(alpha: 0.3)),
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
          SizedBox(height: rs(context, 3)),
          Text(
            'Remove',
            style: textTheme.labelSmall?.copyWith(
              color: colors.loss,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stock Tile ───────────────────────────────────────────────────────────────

// Alternating icon style pairs — defined once, not rebuilt per tile.
const _kIconStyles = [
  (0.12, true), // gain, higher opacity
  (0.08, true), // gain, lower opacity
  (0.10, false), // loss
  (0.15, true), // gain
  (0.08, false), // loss
];

class _StockTile extends StatelessWidget {
  const _StockTile({
    required this.colors,
    required this.textTheme,
    required this.stock,
    required this.index,
  });

  final AppColorScheme colors;
  final TextTheme textTheme;
  final dynamic stock;
  final int index;

  @override
  Widget build(BuildContext context) {
    final (opacity, isGain) = _kIconStyles[index % _kIconStyles.length];
    final iconFg = isGain ? colors.gain : colors.loss;
    final iconBg = iconFg.withValues(alpha: opacity);

    final initials = stock.name.length >= 2
        ? stock.name.substring(0, 2).toUpperCase()
        : stock.name.toUpperCase();

    final isPositive = index % 3 != 2;
    final changeColor = isPositive ? colors.gain : colors.loss;

    return Container(
      key: ValueKey('tile_${stock.id}'),
      margin: EdgeInsets.only(bottom: rs(context, 6)),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(rs(context, 12)),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          // Drag handle — accessible via ReorderableDragStartListener
          ReorderableDragStartListener(
            index: index,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: rs(context, 12),
                vertical: rs(context, 18),
              ),
              child: _DragHandle(colors: colors),
            ),
          ),

          // Icon avatar
          Container(
            width: rs(context, 42),
            height: rs(context, 42),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(rs(context, 10)),
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

          SizedBox(width: rs(context, 12)),

          // Name + subtitle + exchange pills
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: rs(context, 14)),
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
                  SizedBox(height: rs(context, 3)),
                  Text(
                    stock.name,
                    style: textTheme.bodySmall?.copyWith(color: colors.textSec),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: rs(context, 5)),
                  Row(
                    children: [
                      _Pill(
                        label: 'NSE',
                        bg: colors.gain.withValues(alpha: 0.1),
                        fg: colors.gain,
                      ),
                      SizedBox(width: rs(context, 5)),
                      _Pill(
                        label: 'EQ',
                        bg: colors.surfaceHigh,
                        fg: colors.textSec,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Price + change badge
          Padding(
            padding: EdgeInsets.only(right: rs(context, 14)),
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
                SizedBox(height: rs(context, 5)),
                _ChangeBadge(
                  isPositive: isPositive,
                  color: changeColor,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Drag Handle ──────────────────────────────────────────────────────────────

class _DragHandle extends StatelessWidget {
  const _DragHandle({required this.colors});

  final AppColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (_) => Container(
          margin: EdgeInsets.only(bottom: rs(context, 4)),
          width: rs(context, 18),
          height: rs(context, 2),
          decoration: BoxDecoration(
            color: colors.border,
            borderRadius: BorderRadius.circular(rs(context, 2)),
          ),
        ),
      ),
    );
  }
}

// ── Change Badge ─────────────────────────────────────────────────────────────

class _ChangeBadge extends StatelessWidget {
  const _ChangeBadge({
    required this.isPositive,
    required this.color,
    required this.textTheme,
  });

  final bool isPositive;
  final Color color;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: rs(context, 7),
        vertical: rs(context, 3),
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(rs(context, 5)),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        isPositive ? '+1.24%' : '−0.43%',
        style: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

// ── Pill ─────────────────────────────────────────────────────────────────────

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.bg, required this.fg});

  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: rs(context, 7),
        vertical: rs(context, 2),
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(rs(context, 4)),
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
}

// ── Swipe Hint ───────────────────────────────────────────────────────────────

class _SwipeHint extends StatelessWidget {
  const _SwipeHint({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: rs(context, 8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.swipe_left_rounded,
            size: rs(context, 14),
            color: colors.textMuted,
          ),
          SizedBox(width: rs(context, 5)),
          Text(
            'Swipe left to remove',
            style: textTheme.bodySmall?.copyWith(color: colors.textMuted),
          ),
        ],
      ),
    );
  }
}

// ── Bottom Actions ───────────────────────────────────────────────────────────

class _BottomActions extends StatelessWidget {
  const _BottomActions({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, 12),
        rs(context, AppSpacing.md),
        rs(context, 12) + bottomInset,
      ),
      decoration: BoxDecoration(
        color: colors.bg,
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: rs(context, 46),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: colors.border),
                  foregroundColor: colors.textSec,
                  backgroundColor: colors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(rs(context, 12)),
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
          SizedBox(width: rs(context, 10)),
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
                      backgroundColor: colors.surfaceHigh,
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
                    borderRadius: BorderRadius.circular(rs(context, 12)),
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
}

// ── Shared Small Widgets ─────────────────────────────────────────────────────

/// Glowing coloured dot used in the AppBar title.
class _GlowDot extends StatelessWidget {
  const _GlowDot({required this.color, required this.context});

  final Color color;
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    return Container(
      width: rs(context, 8),
      height: rs(context, 8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.6),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}

/// Pill badge used in the AppBar action and list header.
class _LabelPill extends StatelessWidget {
  const _LabelPill({
    required this.label,
    required this.color,
    required this.context,
    required this.textTheme,
  });

  final String label;
  final Color color;
  final BuildContext context;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext _) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: rs(context, 14),
        vertical: rs(context, 7),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(rs(context, 20)),
        color: color.withValues(alpha: 0.08),
      ),
      child: Text(
        label,
        style: textTheme.titleSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Horizontal gradient divider used under the AppBar.
class _GradientDivider extends StatelessWidget {
  const _GradientDivider({required this.colors});

  final AppColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, colors.border, Colors.transparent],
        ),
      ),
    );
  }
}

/// Uppercased section label (e.g. "INSTRUMENTS", "ACTIVE WATCHLIST").
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({
    required this.label,
    required this.colors,
    required this.textTheme,
  });

  final String label;
  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: textTheme.labelSmall?.copyWith(
        color: colors.textSec,
        letterSpacing: 0.9,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
