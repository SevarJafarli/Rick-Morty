import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/tab_navigation_state.dart';
import 'package:rick_and_morty_app/screens/core/characters/characters_screen.dart';
import 'package:rick_and_morty_app/screens/core/episodes_screen.dart';
import 'package:rick_and_morty_app/screens/core/locations_screen.dart';
import 'package:rick_and_morty_app/widgets/bottombar/app_bottom_bar.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabNavigationState>(
      builder: (context, tabState, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            _title(tabState.currentIndex),
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _buildBody(tabState.currentIndex),
        bottomNavigationBar: const AppBottomBar(),
      ),
    );
  }

  String _title(int index) {
    switch (index) {
      case 0:
        return "Characters";
      case 1:
        return "Locations";
      case 2:
        return "Episodes";
      default:
        return "";
    }
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return const CharactersScreen();
      case 1:
        return const LocationsScreen();
      case 2:
        return const EpisodesScreen();
      default:
        return const SizedBox();
    }
  }
}
