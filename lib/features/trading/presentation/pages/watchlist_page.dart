// watchlist_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_demo_app/features/trading/data/models/stock_model.dart';
import 'package:trading_demo_app/features/trading/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:trading_demo_app/features/trading/presentation/pages/edit_watchlist_page.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';
import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/core/theme/app_spacing.dart';
import 'package:trading_demo_app/shared/widget/stock_tile.dart';

// ── Constants ────────────────────────────────────────────────────────────────

const _kTabLabels = ['Watchlist 1', 'Watchlist 5', 'Watchlist 6'];

// ── Page ─────────────────────────────────────────────────────────────────────

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc()..add(const WatchlistEvent.loadWatchlist()),
      child: const _WatchlistView(),
    );
  }
}

// Separated so BlocProvider's context is immediately available
// and the whole scaffold is not a nested Builder.
class _WatchlistView extends StatelessWidget {
  const _WatchlistView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.bg,
      appBar: _WatchlistAppBar(colors: colors, textTheme: textTheme),
      body: Column(
        children: [
          _TopSummary(colors: colors, textTheme: textTheme),
          _SearchBar(colors: colors, textTheme: textTheme),
          _WatchlistTabs(colors: colors, textTheme: textTheme),
          _ActionRow(colors: colors, textTheme: textTheme),
          Expanded(
            child: _StockList(colors: colors, textTheme: textTheme),
          ),
        ],
      ),
    );
  }
}

// ── AppBar ────────────────────────────────────────────────────────────────────

class _WatchlistAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _WatchlistAppBar({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1); // +1 for divider

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colors.bg,
      elevation: 0,
      centerTitle: false,
      titleSpacing: rs(context, 20),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: rs(context, 8),
            height: rs(context, 8),
            margin: EdgeInsets.only(right: rs(context, 8)),
            decoration: BoxDecoration(
              color: colors.gain,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colors.gain.withValues(alpha: 0.6),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Text(
            'Watchlist',
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
          child: GestureDetector(
            onTap: () => _openEditPage(context),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: rs(context, 14),
                vertical: rs(context, 7),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: colors.gain.withValues(alpha: 0.5)),
                borderRadius: BorderRadius.circular(rs(context, 20)),
                color: colors.gain.withValues(alpha: 0.08),
              ),
              child: Text(
                'Edit',
                style: textTheme.titleSmall?.copyWith(
                  color: colors.gain,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, colors.border, Colors.transparent],
            ),
          ),
        ),
      ),
    );
  }

  void _openEditPage(BuildContext context) {
    final bloc = context.read<WatchlistBloc>();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            BlocProvider.value(value: bloc, child: const EditWatchlistPage()),
      ),
    );
  }
}

// ── Market Summary ────────────────────────────────────────────────────────────

class _TopSummary extends StatelessWidget {
  const _TopSummary({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, AppSpacing.sm),
        rs(context, AppSpacing.md),
        rs(context, AppSpacing.xs),
      ),
      child: Row(
        children: [
          Expanded(
            child: MarketCard(
              title: 'SENSEX',
              value: '73,112.41',
              change: '+284.12',
              changePercent: '+0.39%',
              isPositive: true,
              colors: colors,
              textTheme: textTheme,
            ),
          ),
          SizedBox(width: rs(context, 10)),
          Expanded(
            child: MarketCard(
              title: 'NIFTY BANK',
              value: '48,322.85',
              change: '-112.70',
              changePercent: '-0.23%',
              isPositive: false,
              colors: colors,
              textTheme: textTheme,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Search Bar ────────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, 10),
        rs(context, AppSpacing.md),
        rs(context, AppSpacing.xs),
      ),
      child: GestureDetector(
        onTap: () => _WatchlistSnackBar.show(
          context,
          colors: colors,
          textTheme: textTheme,
          message: 'Search screen coming soon',
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: rs(context, AppSpacing.md),
            vertical: rs(context, 13),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(rs(context, 12)),
            color: colors.surface,
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: colors.textSec,
                size: rs(context, 18),
              ),
              SizedBox(width: rs(context, 10)),
              Text(
                'Search stocks, ETFs, futures…',
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.textSec,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Tabs ──────────────────────────────────────────────────────────────────────

class _WatchlistTabs extends StatelessWidget {
  const _WatchlistTabs({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    // BlocSelector rebuilds only when selectedIndex changes — not on every state.
    final selectedTab = context.select<WatchlistBloc, int>(
      (bloc) => bloc.state.maybeWhen(loaded: (_, i, __) => i, orElse: () => 0),
    );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: rs(context, AppSpacing.md),
        vertical: rs(context, 8),
      ),
      height: rs(context, 42),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(rs(context, 10)),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: List.generate(_kTabLabels.length, (index) {
          final isActive = selectedTab == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => context.read<WatchlistBloc>().add(
                WatchlistEvent.changeWatchlist(index: index),
              ),
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
                  _kTabLabels[index],
                  style: textTheme.labelMedium?.copyWith(
                    color: isActive ? colors.textPri : colors.textSec,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ── Action Row ────────────────────────────────────────────────────────────────

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, 2),
        rs(context, AppSpacing.md),
        rs(context, 8),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _SortBottomSheet.show(context, colors, textTheme),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: rs(context, 12),
                vertical: rs(context, 7),
              ),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(rs(context, 8)),
                border: Border.all(color: colors.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.swap_vert_rounded,
                    size: rs(context, 15),
                    color: colors.textSec,
                  ),
                  SizedBox(width: rs(context, 5)),
                  Text(
                    'Sort',
                    style: textTheme.labelMedium?.copyWith(
                      color: colors.textSec,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          _LiveMarketBadge(colors: colors, textTheme: textTheme),
        ],
      ),
    );
  }
}

class _LiveMarketBadge extends StatelessWidget {
  const _LiveMarketBadge({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: rs(context, 10),
        vertical: rs(context, 5),
      ),
      decoration: BoxDecoration(
        color: colors.gain.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(rs(context, 20)),
        border: Border.all(color: colors.gain.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: rs(context, 5),
            height: rs(context, 5),
            decoration: BoxDecoration(
              color: colors.gain,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: rs(context, 5)),
          Text(
            'MARKET OPEN',
            style: textTheme.labelSmall?.copyWith(
              color: colors.gain,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stock List ────────────────────────────────────────────────────────────────

class _StockList extends StatelessWidget {
  const _StockList({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: colors.gain,
              strokeWidth: 2,
            ),
          ),
          loaded: (watchlists, selectedIndex, sortType) {
            final currentList = watchlists[selectedIndex] ?? [];
            final sortedStocks = _getSortedStocks(currentList, sortType);

            if (sortedStocks.isEmpty)
              return _EmptyState(colors: colors, textTheme: textTheme);

            return ListView.separated(
              padding: EdgeInsets.only(
                left: rs(context, AppSpacing.md),
                right: rs(context, AppSpacing.md),
                bottom: MediaQuery.of(context).padding.bottom + rs(context, 80),
              ),
              itemCount: sortedStocks.length,
              separatorBuilder: (_, __) => SizedBox(height: rs(context, 6)),
              itemBuilder: (context, index) {
                final stock = sortedStocks[index];
                return SwipableStockTile(
                  stock: stock,
                  isEditMode: false,
                  index: index,
                  onTap: () => _WatchlistSnackBar.show(
                    context,
                    colors: colors,
                    textTheme: textTheme,
                    message: '${stock.name} details coming soon',
                  ),
                  onDismissed: () {
                    context.read<WatchlistBloc>().add(
                      WatchlistEvent.deleteStock(id: stock.id),
                    );
                    _WatchlistSnackBar.show(
                      context,
                      colors: colors,
                      textTheme: textTheme,
                      message: '${stock.name} removed',
                    );
                  },
                );
              },
            );
          },
          error: (message) => _ErrorState(
            message: message,
            colors: colors,
            textTheme: textTheme,
          ),
        );
      },
    );
  }

  // Kept here since it's specific to stock list display logic
  static List<StockModel> _getSortedStocks(
    List<StockModel> source,
    WatchlistSortType sortType,
  ) {
    final sorted = List<StockModel>.from(source);
    switch (sortType) {
      case WatchlistSortType.priceHighToLow:
        sorted.sort((a, b) => b.price.compareTo(a.price));
      case WatchlistSortType.priceLowToHigh:
        sorted.sort((a, b) => a.price.compareTo(b.price));
      case WatchlistSortType.changeHighToLow:
        sorted.sort((a, b) => b.changePercent.compareTo(a.changePercent));
      case WatchlistSortType.az:
        sorted.sort((a, b) => a.name.compareTo(b.name));
      case WatchlistSortType.none:
        break;
    }
    return sorted;
  }
}

// ── Empty / Error States ──────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: rs(context, 68),
            height: rs(context, 68),
            decoration: BoxDecoration(
              color: colors.gain.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(rs(context, 20)),
              border: Border.all(color: colors.gain.withValues(alpha: 0.2)),
            ),
            child: Icon(
              Icons.bookmark_border_rounded,
              color: colors.gain,
              size: rs(context, 28),
            ),
          ),
          SizedBox(height: rs(context, AppSpacing.md)),
          Text(
            'No stocks yet',
            style: textTheme.titleLarge?.copyWith(
              color: colors.textPri,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: rs(context, 6)),
          Text(
            'Add instruments to track them here',
            style: textTheme.bodySmall?.copyWith(color: colors.textSec),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.message,
    required this.colors,
    required this.textTheme,
  });

  final String message;
  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: colors.loss,
            size: rs(context, 36),
          ),
          SizedBox(height: rs(context, 12)),
          Text(
            message,
            style: textTheme.bodyMedium?.copyWith(color: colors.textSec),
          ),
        ],
      ),
    );
  }
}

// ── Sort Bottom Sheet ─────────────────────────────────────────────────────────

class _SortBottomSheet extends StatelessWidget {
  const _SortBottomSheet({required this.colors, required this.textTheme});

  final AppColorScheme colors;
  final TextTheme textTheme;

  static void show(
    BuildContext context,
    AppColorScheme colors,
    TextTheme textTheme,
  ) {
    // Capture bloc before async gap
    final bloc = context.read<WatchlistBloc>();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _SortBottomSheet(
        colors: colors,
        textTheme: textTheme,
      )._withBloc(bloc),
    );
  }

  Widget _withBloc(WatchlistBloc bloc) {
    return BlocProvider.value(value: bloc, child: this);
  }

  static const _options = [
    (
      label: 'Price — High to Low',
      icon: Icons.arrow_downward_rounded,
      sort: WatchlistSortType.priceHighToLow,
    ),
    (
      label: 'Price — Low to High',
      icon: Icons.arrow_upward_rounded,
      sort: WatchlistSortType.priceLowToHigh,
    ),
    (
      label: '% Change — High to Low',
      icon: Icons.trending_up_rounded,
      sort: WatchlistSortType.changeHighToLow,
    ),
    (
      label: 'Alphabetical A → Z',
      icon: Icons.sort_by_alpha_rounded,
      sort: WatchlistSortType.az,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: rs(context, 12),
                bottom: rs(context, AppSpacing.sm),
              ),
              width: rs(context, 36),
              height: rs(context, 4),
              decoration: BoxDecoration(
                color: colors.borderLight,
                borderRadius: BorderRadius.circular(rs(context, 4)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                rs(context, 20),
                rs(context, 8),
                rs(context, 20),
                rs(context, AppSpacing.md),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sort by',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colors.textPri,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            for (final opt in _options)
              _SortOption(
                label: opt.label,
                icon: opt.icon,
                sortType: opt.sort,
                colors: colors,
                textTheme: textTheme,
              ),
            SizedBox(height: rs(context, 12)),
          ],
        ),
      ),
    );
  }
}

class _SortOption extends StatelessWidget {
  const _SortOption({
    required this.label,
    required this.icon,
    required this.sortType,
    required this.colors,
    required this.textTheme,
  });

  final String label;
  final IconData icon;
  final WatchlistSortType sortType;
  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<WatchlistBloc>().add(
          WatchlistEvent.changeSortType(sortType: sortType),
        );
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: rs(context, AppSpacing.md),
          vertical: rs(context, 4),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: rs(context, AppSpacing.md),
          vertical: rs(context, 13),
        ),
        decoration: BoxDecoration(
          color: colors.bg,
          borderRadius: BorderRadius.circular(rs(context, 12)),
          border: Border.all(color: colors.border),
        ),
        child: Row(
          children: [
            Container(
              width: rs(context, 34),
              height: rs(context, 34),
              decoration: BoxDecoration(
                color: colors.gain.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(rs(context, 10)),
              ),
              child: Icon(icon, color: colors.gain, size: rs(context, 16)),
            ),
            SizedBox(width: rs(context, 14)),
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textPri,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: colors.textMuted,
              size: rs(context, 18),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Shared SnackBar Helper ────────────────────────────────────────────────────

abstract final class _WatchlistSnackBar {
  static void show(
    BuildContext context, {
    required AppColorScheme colors,
    required TextTheme textTheme,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: textTheme.bodyMedium?.copyWith(color: colors.textPri),
        ),
        backgroundColor: colors.surfaceHigh,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// ── Market Card (unchanged, already a separate widget) ────────────────────────

class MarketCard extends StatelessWidget {
  const MarketCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.changePercent,
    required this.isPositive,
    required this.colors,
    required this.textTheme,
  });

  final String title;
  final String value;
  final String change;
  final String changePercent;
  final bool isPositive;
  final AppColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? colors.gain : colors.loss;
    final bgColor = isPositive
        ? colors.gain.withValues(alpha: 0.08)
        : colors.loss.withValues(alpha: 0.08);

    return Container(
      padding: EdgeInsets.all(rs(context, 14)),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(rs(context, 14)),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: textTheme.labelSmall?.copyWith(
                  color: colors.textSec,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.9,
                ),
              ),
              const Spacer(),
              Container(
                width: rs(context, 5),
                height: rs(context, 5),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.6),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: rs(context, 8)),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: colors.textPri,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.6,
            ),
          ),
          SizedBox(height: rs(context, 7)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: rs(context, 7),
              vertical: rs(context, 4),
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(rs(context, 6)),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: color,
                  size: rs(context, 14),
                ),
                Text(
                  '$change  $changePercent',
                  style: textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
