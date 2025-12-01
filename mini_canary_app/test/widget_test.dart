import 'package:flutter_test/flutter_test.dart';

import 'package:mini_canary_app/core/di/injection_container.dart';
import 'package:mini_canary_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await sl.reset();
    await configureDependencies();
  });

  testWidgets('User feed renders partner cards', (tester) async {
    await tester.pumpWidget(const MiniCanaryMatchingApp());

    await tester.pump(const Duration(seconds: 1));

    expect(find.textContaining('Learn with'), findsWidgets);
  });

  testWidgets('Opening match modal shows success state', (tester) async {
    await tester.pumpWidget(const MiniCanaryMatchingApp());
    await tester.pump(const Duration(seconds: 1));

    final button = find.textContaining('Learn with').first;
    await tester.tap(button);
    await tester.pump();

    expect(find.text('Matching...'), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));

    expect(find.textContaining('You matched'), findsOneWidget);
  });
}
