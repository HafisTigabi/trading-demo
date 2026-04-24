import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_demo_app/shared/routes/routes.dart';

import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/core/theme/app_spacing.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

// ─── Main Navigation Page ──────────────────────────────────────────────────────

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key, required this.child});

  final Widget child;

  static const _navItems = [
    _NavItem(
      icon: _TradingIcons.watchlistOutline,
      activeIcon: _TradingIcons.watchlistFilled,
      label: 'Watchlist',
    ),
    _NavItem(
      icon: _TradingIcons.ordersOutline,
      activeIcon: _TradingIcons.ordersFilled,
      label: 'Orders',
    ),
    _NavItem(
      icon: Icons.add,
      activeIcon: Icons.add,
      label: 'GTT+',
      isSpecial: true,
    ),
    _NavItem(
      icon: _TradingIcons.portfolioOutline,
      activeIcon: _TradingIcons.portfolioFilled,
      label: 'Portfolio',
    ),
    _NavItem(
      icon: _TradingIcons.fundsOutline,
      activeIcon: _TradingIcons.fundsFilled,
      label: 'Funds',
    ),
    _NavItem(
      icon: _TradingIcons.profileOutline,
      activeIcon: _TradingIcons.profileFilled,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    final selectedIndex = _getSelectedIndex(context);
    return Scaffold(
      backgroundColor: colors.bg,
      extendBody: true,
      body: child,
      bottomNavigationBar: _TradingNavBar(
        selectedIndex: selectedIndex,
        items: _navItems,
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRoutes.orders)) return 1;
    if (location.startsWith(AppRoutes.gtt)) return 2;
    if (location.startsWith(AppRoutes.portfolio)) return 3;
    if (location.startsWith(AppRoutes.funds)) return 4;
    if (location.startsWith(AppRoutes.profile)) return 5;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    const routes = [
      AppRoutes.watchlist,
      AppRoutes.orders,
      AppRoutes.gtt,
      AppRoutes.portfolio,
      AppRoutes.funds,
      AppRoutes.profile,
    ];
    context.go(routes[index]);
  }
}

// ─── Icon Set ──────────────────────────────────────────────────────────────────

class _TradingIcons {
  // Watchlist — eye
  static const watchlistOutline = Icons.visibility_outlined;
  static const watchlistFilled = Icons.visibility;

  // Orders — receipt / document
  static const ordersOutline = Icons.receipt_long_outlined;
  static const ordersFilled = Icons.receipt_long;

  // Portfolio — pie chart
  static const portfolioOutline = Icons.pie_chart_outline_rounded;
  static const portfolioFilled = Icons.pie_chart_rounded;

  // Funds — account balance / wallet
  static const fundsOutline = Icons.account_balance_wallet_outlined;
  static const fundsFilled = Icons.account_balance_wallet;

  // Profile — person
  static const profileOutline = Icons.person_outline_rounded;
  static const profileFilled = Icons.person_rounded;
}

// ─── Data Model ────────────────────────────────────────────────────────────────

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSpecial;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.isSpecial = false,
  });
}

// ─── Trading Nav Bar ───────────────────────────────────────────────────────────

class _TradingNavBar extends StatefulWidget {
  const _TradingNavBar({
    required this.selectedIndex,
    required this.items,
    required this.onTap,
  });

  final int selectedIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  @override
  State<_TradingNavBar> createState() => _TradingNavBarState();
}

class _TradingNavBarState extends State<_TradingNavBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pillController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 380),
  );
  late final Animation<double> _pillAnim = CurvedAnimation(
    parent: _pillController,
    curve: Curves.easeInOutCubicEmphasized,
  );
  int _previousIndex = 0;

  @override
  void initState() {
    super.initState();
    _previousIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(_TradingNavBar old) {
    super.didUpdateWidget(old);
    if (old.selectedIndex != widget.selectedIndex) {
      _previousIndex = old.selectedIndex;
      _pillController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _pillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.only(left: rs(context, AppSpacing.md), right: rs(context, AppSpacing.md), bottom: bottomPadding + rs(context, 12)),
      child: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rs(context, 28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 40,
            spreadRadius: -4,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            color: colors.accent.withValues(alpha: 0.12),
            blurRadius: 24,
            spreadRadius: -2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(rs(context, 28)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(rs(context, 28)),
              color: colors.surface.withValues(alpha: 0.82), // ~82% opaque navy
              border: Border.all(color: colors.borderLight, width: 0.5),
            ),
            child: _buildNavContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildNavContent(BuildContext context) {
    return SizedBox(
      height: rs(context, 62),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / widget.items.length;

          return Stack(
            children: [
              // Sliding pill — hidden when GTT (index 2) is selected
              if (widget.selectedIndex != 2)
                AnimatedBuilder(
                  animation: _pillAnim,
                  builder: (context, _) {
                    final fromIndex = _previousIndex == 2
                        ? widget.selectedIndex
                        : _previousIndex;
                    final fromX = fromIndex * itemWidth;
                    final toX = widget.selectedIndex * itemWidth;
                    final x = fromX + (toX - fromX) * _pillAnim.value;

                    return Positioned(
                      left: x + 4,
                      top: 7,
                      width: itemWidth - 6,
                      height: 48,
                      child: _GlowPill(),
                    );
                  },
                ),

              // Items row
              Row(
                children: List.generate(widget.items.length, (i) {
                  final item = widget.items[i];
                  final isSelected = i == widget.selectedIndex;

                  if (item.isSpecial) {
                    return Expanded(
                      child: _GttButton(
                        isSelected: isSelected,
                        onTap: () => widget.onTap(i),
                      ),
                    );
                  }

                  return Expanded(
                    child: _NavItemWidget(
                      item: item,
                      isSelected: isSelected,
                      onTap: () => widget.onTap(i),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Pill Indicator ────────────────────────────────────────────────────────────

class _GlowPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rs(context, 18)),
        color: colors.accentGlow,
        border: Border.all(color: colors.accent.withValues(alpha: 0.3), width: 0.5),
      ),
    );
  }
}

// ─── GTT+ Special Button ───────────────────────────────────────────────────────

class _GttButton extends StatefulWidget {
  const _GttButton({required this.isSelected, required this.onTap});

  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_GttButton> createState() => _GttButtonState();
}

class _GttButtonState extends State<_GttButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 280),
  );

  late final Animation<double> _scale = TweenSequence([
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.0,
        end: 0.86,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 30,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 0.86,
        end: 1.10,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 40,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.10,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.elasticOut)),
      weight: 30,
    ),
  ]).animate(_ctrl);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return GestureDetector(
      onTap: () {
        _ctrl.forward(from: 0);
        widget.onTap();
      },
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: AnimatedBuilder(
          animation: _scale,
          builder: (context, child) =>
              Transform.scale(scale: _scale.value, child: child),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: rs(context, 42),
                height: rs(context, 42),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colors.accent, colors.accentText],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors.accent.withValues(alpha: 0.4),
                      blurRadius: 16,
                      spreadRadius: -2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.add, color: Colors.white, size: rs(context, 22)),
              ),
              // GTT badge
              Positioned(
                top: rs(context, -4),
                right: rs(context, -6),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: rs(context, 4),
                    vertical: rs(context, 1.5),
                  ),
                  decoration: BoxDecoration(
                    color: colors.loss,
                    borderRadius: BorderRadius.circular(rs(context, 8)),
                    border: Border.all(
                      color: colors.bg,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    'GTT',
                    style: TextStyle(
                      fontSize: rs(context, 8),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Regular Nav Item ──────────────────────────────────────────────────────────

class _NavItemWidget extends StatefulWidget {
  const _NavItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_NavItemWidget> createState() => _NavItemWidgetState();
}

class _NavItemWidgetState extends State<_NavItemWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> _scale = TweenSequence([
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.0,
        end: 0.82,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 30,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 0.82,
        end: 1.08,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: 40,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.08,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.elasticOut)),
      weight: 30,
    ),
  ]).animate(_ctrl);

  @override
  void didUpdateWidget(_NavItemWidget old) {
    super.didUpdateWidget(old);
    if (!old.isSelected && widget.isSelected) {
      _ctrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    return GestureDetector(
      onTap: () {
        _ctrl.forward(from: 0);
        widget.onTap();
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) => Transform.scale(
          scale: widget.isSelected ? _scale.value : 1.0,
          child: child,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              transitionBuilder: (child, anim) => ScaleTransition(
                scale: anim,
                child: FadeTransition(opacity: anim, child: child),
              ),
              child: Icon(
                widget.isSelected ? widget.item.activeIcon : widget.item.icon,
                key: ValueKey(widget.isSelected),
                color: widget.isSelected
                    ? colors.accent
                    : colors.textSec,
                size: rs(context, 20),
              ),
            ),
            SizedBox(height: rs(context, 3)),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: TextStyle(
                fontSize: rs(context, widget.isSelected ? 10 : 9.5),
                fontWeight: widget.isSelected
                    ? FontWeight.w500
                    : FontWeight.w400,
                color: widget.isSelected
                    ? colors.accent
                    : colors.textSec,
                letterSpacing: widget.isSelected ? 0.2 : 0.1,
              ),
              child: Text(widget.item.label),
            ),
          ],
        ),
      ),
    );
  }
}
