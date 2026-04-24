import 'package:flutter/material.dart';
import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/core/theme/app_spacing.dart';
import 'package:trading_demo_app/features/trading/data/models/stock_model.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

class StockTile extends StatelessWidget {
  final StockModel stock;
  final bool isEditMode;
  final int? index;
  final VoidCallback? onTap;

  const StockTile({
    super.key,
    required this.stock,
    this.isEditMode = false,
    this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    final isPositive = stock.change >= 0;
    final changeColor = isPositive ? colors.gain : colors.loss;
    final changeBg = isPositive ? colors.gainBg : colors.lossBg;
    final changeText = _signed(stock.changePercent);

    final iconStyles = [
      (colors.accentSoft, colors.accentText),
      (colors.gainBg, colors.gain),
      (colors.amberBg, colors.amber),
      (colors.purpleBg, colors.purple),
      (colors.lossBg, colors.loss),
    ];
    final (iconBg, iconFg) = iconStyles[(index ?? 0) % iconStyles.length];
    
    final initials = stock.symbol.length >= 2
        ? stock.symbol.substring(0, 2).toUpperCase()
        : stock.symbol.toUpperCase();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isEditMode ? 0 : rs(context, AppSpacing.md),
          vertical: rs(context, isEditMode ? 10 : 14),
        ),
        decoration: BoxDecoration(
          color: isEditMode ? colors.surface : colors.card,
          borderRadius: BorderRadius.circular(rs(context, isEditMode ? 12 : 16)),
          border: Border.all(color: colors.border, width: 0.5),
        ),
        child: Row(
          children: [
            if (isEditMode)
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
                        borderRadius: BorderRadius.circular(rs(context, 2)),
                      ),
                    ),
                  ),
                ),
              ),

            Container(
              width: rs(context, 42),
              height: rs(context, 42),
              decoration: BoxDecoration(
                color: isEditMode ? iconBg : colors.accentGlow,
                borderRadius: BorderRadius.circular(rs(context, isEditMode ? 10 : 12)),
                border: isEditMode ? null : Border.all(color: colors.accent.withValues(alpha: 0.3)),
              ),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: TextStyle(
                  fontSize: rs(context, 13),
                  fontWeight: FontWeight.w700,
                  color: isEditMode ? iconFg : colors.accent,
                  letterSpacing: isEditMode ? 0 : 0.5,
                ),
              ),
            ),
            
            SizedBox(width: rs(context, 12)),

            // Name + full name/symbol
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.name,
                    style: TextStyle(
                      color: colors.textPri,
                      fontWeight: FontWeight.w700,
                      fontSize: rs(context, 15),
                      letterSpacing: -0.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: rs(context, 3)),
                  if (isEditMode) ...[
                    Text(
                      stock.name,
                      style: TextStyle(
                        fontSize: rs(context, 12),
                        color: colors.textSec,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: rs(context, 5)),
                    Row(
                      children: [
                        _pill('NSE', colors.accentSoft, colors.accentText, context),
                        SizedBox(width: rs(context, 5)),
                        _pill('EQ', colors.surfaceHigh, colors.textSec, context),
                      ],
                    ),
                  ] else ...[
                    Text(
                      stock.symbol,
                      style: TextStyle(
                        color: colors.textSec,
                        fontSize: rs(context, 12),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]
                ],
              ),
            ),

            // Price + change
            Padding(
              padding: EdgeInsets.only(right: isEditMode ? rs(context, 14) : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹${stock.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: colors.textPri,
                      fontWeight: FontWeight.w700,
                      fontSize: rs(context, 15),
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: rs(context, 5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: rs(context, 7),
                      vertical: rs(context, 3),
                    ),
                    decoration: BoxDecoration(
                      color: changeBg,
                      borderRadius: BorderRadius.circular(rs(context, 5)),
                    ),
                    child: Text(
                      '$changeText%',
                      style: TextStyle(
                        color: changeColor,
                        fontSize: rs(context, 11.5),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pill(String label, Color bg, Color fg, BuildContext context) {
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
        style: TextStyle(
          fontSize: rs(context, 10),
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }

  String _signed(double value) {
    if (value > 0) return '+${value.toStringAsFixed(2)}';
    return value.toStringAsFixed(2);
  }
}

class SwipableStockTile extends StatelessWidget {
  final StockModel stock;
  final bool isEditMode;
  final int? index;
  final VoidCallback? onTap;
  final Future<bool?> Function()? onConfirmDismiss;
  final VoidCallback? onDismissed;

  const SwipableStockTile({
    super.key,
    required this.stock,
    this.isEditMode = false,
    this.index,
    this.onTap,
    this.onConfirmDismiss,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorScheme>()!;
    
    return Dismissible(
      key: ValueKey(stock.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        if (onConfirmDismiss != null) {
          return await onConfirmDismiss!();
        }
        return true;
      },
      onDismissed: (_) {
        if (onDismissed != null) {
          onDismissed!();
        }
      },
      background: Container(
        margin: EdgeInsets.only(bottom: rs(context, isEditMode ? 8 : 0)),
        decoration: BoxDecoration(
          color: isEditMode ? colors.loss.withValues(alpha: 0.15) : colors.loss.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(rs(context, isEditMode ? 12 : 16)),
          border: isEditMode ? null : Border.all(color: colors.loss.withValues(alpha: 0.4)),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: rs(context, 22)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline_rounded,
              color: colors.loss,
              size: rs(context, isEditMode ? 26 : 22),
            ),
            SizedBox(height: rs(context, 3)),
            Text(
              'Remove',
              style: TextStyle(
                color: colors.loss,
                fontSize: rs(context, isEditMode ? 11 : 10),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      child: StockTile(
        stock: stock,
        isEditMode: isEditMode,
        index: index,
        onTap: onTap,
      ),
    );
  }
}
