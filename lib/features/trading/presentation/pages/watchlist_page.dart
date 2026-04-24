import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_demo_app/features/trading/data/models/stock_model.dart';
import 'package:trading_demo_app/features/trading/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:trading_demo_app/features/trading/presentation/pages/edit_watchlist_page.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/core/theme/app_spacing.dart';
import 'package:trading_demo_app/core/theme/app_theme.dart';
import 'package:trading_demo_app/shared/widget/stock_tile.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc()..add(const WatchlistEvent.loadWatchlist()),
      child: Builder(
        builder: (context) {
          return Theme(
            data: AppTheme.getTheme(context, isDark: true),
            child: Builder(
              builder: (context) {
                final colors = Theme.of(context).extension<AppColorScheme>()!;
                return Scaffold(
                  backgroundColor: const Color(0xFF0A0E17),
                  appBar: _buildAppBar(context, colors),
                  body: Column(
                    children: [
                      _buildTopSummary(context, colors),
                      _buildSearchBar(context, colors),
                      _buildTabs(context, colors),
                      _buildActionRow(context, colors),
                      Expanded(
                        child: BlocBuilder<WatchlistBloc, WatchlistState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const SizedBox.shrink(),
                              loading: () => _buildLoader(context),
                              loaded: (watchlists, selectedIndex, sortType) {
                                final currentList =
                                    watchlists[selectedIndex] ?? [];
                                final sortedStocks = _getSortedStocks(
                                  currentList,
                                  sortType,
                                );
                                if (sortedStocks.isEmpty) {
                                  return _buildEmpty(context);
                                }
                                return ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: rs(context, AppSpacing.md),
                                    right: rs(context, AppSpacing.md),
                                    bottom:
                                        MediaQuery.of(context).padding.bottom +
                                        rs(context, 80),
                                  ),
                                  itemCount: sortedStocks.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: rs(context, 6)),
                                  itemBuilder: (context, index) {
                                    final stock = sortedStocks[index];
                                    return SwipableStockTile(
                                      stock: stock,
                                      isEditMode: false,
                                      index: index,
                                      onTap: () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${stock.name} details coming soon',
                                            ),
                                            backgroundColor: const Color(
                                              0xFF1C2333,
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    rs(context, 12),
                                                  ),
                                            ),
                                          ),
                                        );
                                      },
                                      onDismissed: () {
                                        context.read<WatchlistBloc>().add(
                                          WatchlistEvent.deleteStock(
                                            id: stock.id,
                                          ),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${stock.name} removed',
                                            ),
                                            backgroundColor: const Color(
                                              0xFF1C2333,
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    rs(context, 12),
                                                  ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              error: (message) =>
                                  _buildError(context, message, colors),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    AppColorScheme colors,
  ) {
    return AppBar(
      backgroundColor: const Color(0xFF0A0E17),
      elevation: 0,
      centerTitle: false,
      titleSpacing: rs(context, 20),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Animated dot
          Container(
            width: rs(context, 8),
            height: rs(context, 8),
            margin: EdgeInsets.only(right: rs(context, 8)),
            decoration: BoxDecoration(
              color: const Color(0xFF00C076),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00C076).withOpacity(0.6),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          Text(
            'Watchlist',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: rs(context, 20),
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: rs(context, AppSpacing.md)),
          child: GestureDetector(
            onTap: () {
              final bloc = context.read<WatchlistBloc>();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => BlocProvider.value(
                    value: bloc,
                    child: const EditWatchlistPage(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: rs(context, 14),
                vertical: rs(context, 7),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF00C076).withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(rs(context, 20)),
                color: const Color(0xFF00C076).withOpacity(0.08),
              ),
              child: Text(
                'Edit',
                style: TextStyle(
                  color: const Color(0xFF00C076),
                  fontWeight: FontWeight.w600,
                  fontSize: rs(context, 13),
                  letterSpacing: 0.2,
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
              colors: [
                Colors.transparent,
                const Color(0xFF1E2A3A),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSummary(BuildContext context, AppColorScheme colors) {
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
            child: _MarketCard(
              title: 'SENSEX',
              value: '73,112.41',
              change: '+284.12',
              changePercent: '+0.39%',
              isPositive: true,
            ),
          ),
          SizedBox(width: rs(context, 10)),
          Expanded(
            child: _MarketCard(
              title: 'NIFTY BANK',
              value: '48,322.85',
              change: '-112.70',
              changePercent: '-0.23%',
              isPositive: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, AppColorScheme colors) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        rs(context, AppSpacing.md),
        rs(context, 10),
        rs(context, AppSpacing.md),
        rs(context, AppSpacing.xs),
      ),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Search screen coming soon'),
              backgroundColor: const Color(0xFF1C2333),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(rs(context, 12)),
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: rs(context, AppSpacing.md),
            vertical: rs(context, 13),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(rs(context, 12)),
            color: const Color(0xFF111827),
            border: Border.all(color: const Color(0xFF1E2A3A), width: 1),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: const Color(0xFF4B5563),
                size: rs(context, 18),
              ),
              SizedBox(width: rs(context, 10)),
              Text(
                'Search stocks, ETFs, futures…',
                style: TextStyle(
                  color: const Color(0xFF4B5563),
                  fontSize: rs(context, 13.5),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: rs(context, 7),
                  vertical: rs(context, 3),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C2333),
                  borderRadius: BorderRadius.circular(rs(context, 5)),
                  border: Border.all(color: const Color(0xFF2A3A50), width: 1),
                ),
                child: Text(
                  '⌘ K',
                  style: TextStyle(
                    color: const Color(0xFF4B5563),
                    fontSize: rs(context, 10),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabs(BuildContext context, AppColorScheme colors) {
    const tabs = ['Watchlist 1', 'Watchlist 5', 'Watchlist 6'];
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        final selectedTab = state.maybeWhen(
          loaded: (_, selectedIndex, __) => selectedIndex,
          orElse: () => 0,
        );
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: rs(context, AppSpacing.md),
            vertical: rs(context, 8),
          ),
          height: rs(context, 42),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(rs(context, 10)),
            border: Border.all(color: const Color(0xFF1E2A3A), width: 1),
          ),
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isActive = selectedTab == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.read<WatchlistBloc>().add(
                      WatchlistEvent.changeWatchlist(index: index),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.all(rs(context, 4)),
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF00C076)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(rs(context, 7)),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: const Color(
                                  0xFF00C076,
                                ).withOpacity(0.25),
                                blurRadius: 12,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isActive
                            ? Colors.white
                            : const Color(0xFF4B5563),
                        fontWeight: isActive
                            ? FontWeight.w700
                            : FontWeight.w500,
                        fontSize: rs(context, 12),
                        letterSpacing: isActive ? 0.1 : 0,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  Widget _buildActionRow(BuildContext context, AppColorScheme colors) {
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
            onTap: () => _showSortBottomSheet(context, colors),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: rs(context, 12),
                vertical: rs(context, 7),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(rs(context, 8)),
                border: Border.all(color: const Color(0xFF1E2A3A), width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.swap_vert_rounded,
                    size: rs(context, 15),
                    color: const Color(0xFF6B7280),
                  ),
                  SizedBox(width: rs(context, 5)),
                  Text(
                    'Sort',
                    style: TextStyle(
                      color: const Color(0xFF6B7280),
                      fontSize: rs(context, 12),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Live market indicator
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: rs(context, 10),
              vertical: rs(context, 5),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF00C076).withOpacity(0.08),
              borderRadius: BorderRadius.circular(rs(context, 20)),
              border: Border.all(
                color: const Color(0xFF00C076).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: rs(context, 5),
                  height: rs(context, 5),
                  decoration: const BoxDecoration(
                    color: Color(0xFF00C076),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: rs(context, 5)),
                Text(
                  'MARKET OPEN',
                  style: TextStyle(
                    color: const Color(0xFF00C076),
                    fontSize: rs(context, 9.5),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context, AppColorScheme colors) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF111827),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                    color: const Color(0xFF2A3A50),
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
                  child: Row(
                    children: [
                      Text(
                        'Sort by',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: rs(context, 17),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                _sortOption(
                  context,
                  bottomSheetContext,
                  colors,
                  label: 'Price — High to Low',
                  icon: Icons.arrow_downward_rounded,
                  sortType: WatchlistSortType.priceHighToLow,
                ),
                _sortOption(
                  context,
                  bottomSheetContext,
                  colors,
                  label: 'Price — Low to High',
                  icon: Icons.arrow_upward_rounded,
                  sortType: WatchlistSortType.priceLowToHigh,
                ),
                _sortOption(
                  context,
                  bottomSheetContext,
                  colors,
                  label: '% Change — High to Low',
                  icon: Icons.trending_up_rounded,
                  sortType: WatchlistSortType.changeHighToLow,
                ),
                _sortOption(
                  context,
                  bottomSheetContext,
                  colors,
                  label: 'Alphabetical A → Z',
                  icon: Icons.sort_by_alpha_rounded,
                  sortType: WatchlistSortType.az,
                ),
                SizedBox(height: rs(context, 12)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sortOption(
    BuildContext context,
    BuildContext sheetContext,
    AppColorScheme colors, {
    required String label,
    required IconData icon,
    required WatchlistSortType sortType,
  }) {
    return InkWell(
      onTap: () {
        context.read<WatchlistBloc>().add(
          WatchlistEvent.changeSortType(sortType: sortType),
        );
        Navigator.pop(sheetContext);
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
          color: const Color(0xFF0A0E17),
          borderRadius: BorderRadius.circular(rs(context, 12)),
          border: Border.all(color: const Color(0xFF1E2A3A), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: rs(context, 34),
              height: rs(context, 34),
              decoration: BoxDecoration(
                color: const Color(0xFF00C076).withOpacity(0.1),
                borderRadius: BorderRadius.circular(rs(context, 10)),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF00C076),
                size: rs(context, 16),
              ),
            ),
            SizedBox(width: rs(context, 14)),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: rs(context, 14),
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: const Color(0xFF2A3A50),
              size: rs(context, 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xFF00C076),
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: rs(context, 68),
            height: rs(context, 68),
            decoration: BoxDecoration(
              color: const Color(0xFF00C076).withOpacity(0.08),
              borderRadius: BorderRadius.circular(rs(context, 20)),
              border: Border.all(
                color: const Color(0xFF00C076).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.bookmark_border_rounded,
              color: const Color(0xFF00C076),
              size: rs(context, 28),
            ),
          ),
          SizedBox(height: rs(context, AppSpacing.md)),
          Text(
            'No stocks yet',
            style: TextStyle(
              color: Colors.white,
              fontSize: rs(context, 16),
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: rs(context, 6)),
          Text(
            'Add instruments to track them here',
            style: TextStyle(
              color: const Color(0xFF4B5563),
              fontSize: rs(context, 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(
    BuildContext context,
    String message,
    AppColorScheme colors,
  ) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: const Color(0xFFEF4444),
            size: rs(context, 36),
          ),
          SizedBox(height: rs(context, 12)),
          Text(
            message,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: rs(context, 14),
            ),
          ),
        ],
      ),
    );
  }

  List<StockModel> _getSortedStocks(
    List<StockModel> source,
    WatchlistSortType sortType,
  ) {
    final sorted = List<StockModel>.from(source);
    switch (sortType) {
      case WatchlistSortType.priceHighToLow:
        sorted.sort((a, b) => b.price.compareTo(a.price));
        break;
      case WatchlistSortType.priceLowToHigh:
        sorted.sort((a, b) => a.price.compareTo(b.price));
        break;
      case WatchlistSortType.changeHighToLow:
        sorted.sort((a, b) => b.changePercent.compareTo(a.changePercent));
        break;
      case WatchlistSortType.az:
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case WatchlistSortType.none:
        break;
    }
    return sorted;
  }
}

// ─────────────────────────────────────────────
//  Market Summary Card — Redesigned
// ─────────────────────────────────────────────
class _MarketCard extends StatelessWidget {
  const _MarketCard({
    required this.title,
    required this.value,
    required this.change,
    required this.changePercent,
    required this.isPositive,
  });

  final String title;
  final String value;
  final String change;
  final String changePercent;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final gainColor = const Color(0xFF00C076);
    final lossColor = const Color(0xFFEF4444);
    final color = isPositive ? gainColor : lossColor;
    final bgColor = isPositive
        ? const Color(0xFF00C076).withOpacity(0.08)
        : const Color(0xFFEF4444).withOpacity(0.08);

    return Container(
      padding: EdgeInsets.all(rs(context, 14)),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(rs(context, 14)),
        border: Border.all(color: const Color(0xFF1E2A3A), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF6B7280),
                  fontSize: rs(context, 10.5),
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
                    BoxShadow(color: color.withOpacity(0.6), blurRadius: 5),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: rs(context, 8)),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: rs(context, 17),
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
              border: Border.all(color: color.withOpacity(0.2), width: 1),
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
                  style: TextStyle(
                    color: color,
                    fontSize: rs(context, 10.5),
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
