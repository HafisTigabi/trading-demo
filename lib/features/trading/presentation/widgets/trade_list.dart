import 'package:flutter/material.dart';
import 'package:trading_demo_app/features/trading/domain/entities/trade.dart';

class TradeList extends StatelessWidget {
  const TradeList({super.key, required this.trades});

  final List<Trade> trades;

  @override
  Widget build(BuildContext context) {
    if (trades.isEmpty) {
      return const Center(child: Text('No trades available'));
    }

    return ListView.separated(
      itemCount: trades.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final trade = trades[index];
        return ListTile(
          title: Text(trade.symbol),
          subtitle: Text('Qty: ${trade.quantity}'),
          trailing: Text('\$${trade.price.toStringAsFixed(2)}'),
        );
      },
    );
  }
}
