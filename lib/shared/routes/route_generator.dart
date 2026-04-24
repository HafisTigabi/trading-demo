import 'package:go_router/go_router.dart';
import 'package:trading_demo_app/features/trading/presentation/pages/coming_soon_page.dart';
import 'package:trading_demo_app/features/trading/presentation/pages/home_page.dart';
import 'package:trading_demo_app/features/trading/presentation/pages/watchlist_page.dart';
import 'package:trading_demo_app/shared/routes/routes.dart';
import 'package:trading_demo_app/shared/widget/bottom_navigation/bottom_navigation.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.watchlist,
  errorBuilder: (context, state) => const ComingSoonPage(),
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainNavigationPage(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRoutes.watchlist,
          builder: (context, state) => const WatchlistPage(),
        ),
        GoRoute(
          path: AppRoutes.orders,
          builder: (context, state) => const ComingSoonPage(title: 'Orders'),
        ),
        GoRoute(
          path: AppRoutes.gtt,
          builder: (context, state) => const ComingSoonPage(title: 'GTT+'),
        ),
        GoRoute(
          path: AppRoutes.portfolio,
          builder: (context, state) => const ComingSoonPage(title: 'Portfolio'),
        ),
        GoRoute(
          path: AppRoutes.funds,
          builder: (context, state) => const ComingSoonPage(title: 'Funds'),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) => const ComingSoonPage(title: 'Profile'),
        ),
      ],
    ),
  ],
);
