import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/tab_navigation_state.dart';
import 'package:rick_and_morty_app/style/theme/app_theme.dart';
import 'package:rick_and_morty_app/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TabNavigationState>(
          create: (context) => TabNavigationState(),
        ),
      ],
      child: MaterialApp(
        title: 'Rick & Morty',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(context),
        darkTheme: AppTheme.darkTheme(context),
        home: const Wrapper(),
      ),
    );
  }
}
