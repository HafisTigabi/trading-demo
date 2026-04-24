import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trading_demo_app/shared/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push(AppRoutes.watchlist),
          child: const Text('Go to Watchlist'),
        ),
      ),
    );
  }
}
