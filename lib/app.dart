import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:trading_demo_app/core/theme/app_theme.dart';
import 'package:trading_demo_app/shared/routes/route_generator.dart';

class TradingDemoApp extends StatelessWidget {
  const TradingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Trading Demo',
            theme: AppTheme.getTheme(context),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
