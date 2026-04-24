import 'package:flutter/material.dart';
import 'package:trading_demo_app/core/theme/app_colors.dart';
import 'package:trading_demo_app/core/theme/app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme(BuildContext context, {bool isDark = true}) {
    final colorScheme = isDark ? AppColorScheme.dark() : AppColorScheme.light();
    
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: colorScheme.bg,
      canvasColor: colorScheme.surface,
      fontFamily: 'SF Pro Display',
      textTheme: AppTypography.getTextTheme(context).apply(
        bodyColor: colorScheme.textPri,
        displayColor: colorScheme.textPri,
      ),
      extensions: <ThemeExtension<dynamic>>[
        colorScheme,
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.bg,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
