import 'package:flutter/material.dart';
import 'package:trading_demo_app/shared/helper/responsive_size.dart';

class AppTypography {
  AppTypography._();

  static TextTheme getTextTheme(BuildContext context) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 32),
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
      ),
      displayMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 28),
        fontWeight: FontWeight.w700,
        letterSpacing: -0.8,
      ),
      displaySmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 24),
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 20),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 17),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 16),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 15),
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
      titleMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 14),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleSmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 13),
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 16),
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 14),
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 12),
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 14),
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 12),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
      labelSmall: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: rs(context, 11),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.7,
      ),
    );
  }
}
