import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_container.dart';
import 'presentation/bloc/partner_feed/partner_feed_bloc.dart';
import 'presentation/screens/feed/user_feed_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MiniCanaryMatchingApp());
}

class MiniCanaryMatchingApp extends StatelessWidget {
  const MiniCanaryMatchingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFA726)),
      scaffoldBackgroundColor: const Color(0xFFF8F7FC),
      fontFamily: 'Roboto',
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<PartnerFeedBloc>()..add(const PartnerFeedRequested()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Canary Matching + Profiles',
        theme: baseTheme.copyWith(
          textTheme: baseTheme.textTheme.apply(
            bodyColor: const Color(0xFF14121E),
            displayColor: const Color(0xFF14121E),
          ),
        ),
        home: const UserFeedScreen(),
      ),
    );
  }
}
