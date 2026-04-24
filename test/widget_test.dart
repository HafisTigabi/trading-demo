// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:trading_demo_app/app.dart';

void main() {
  testWidgets('Watchlist tab is shown by default', (WidgetTester tester) async {
    await tester.pumpWidget(const TradingDemoApp());
    await tester.pump();

    expect(find.text('Watchlist'), findsOneWidget);
    expect(find.text('Watchlist Page'), findsOneWidget);
  });
}
