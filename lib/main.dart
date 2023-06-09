import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app.router.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

import 'config/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);

    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode)
      //     .getTheme(),
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme(selectedColor: 4).getTheme(),
    //   home: const HomeScreen(),
    //   routes: {
    //     '/buttons': (context) => const ButtonsScreen(),
    //     '/cards': (context) => const CardsScreen(),
    //   },
    // );
  }
}
