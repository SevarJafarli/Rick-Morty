import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/model/enum/Tabs.dart';
import 'package:rick_and_morty_app/providers/tab_navigation_state.dart';

List<AppBottomBarItem> tabs = [
  AppBottomBarItem(tab: Tabs.characters),
  AppBottomBarItem(tab: Tabs.locations),
  AppBottomBarItem(tab: Tabs.episodes),
];

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabNavigationState>(
      builder: (context, tabState, child) => BottomNavigationBar(
        currentIndex: tabState.currentIndex,
        onTap: (value) {
          tabState.switchTab(value);
        },
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        items: [
          for (AppBottomBarItem tab in tabs) ...[
            BottomNavigationBarItem(
              icon: tab.icon,
              label: tab.label,
            ),
          ]
        ],
      ),
    );
  }
}

class AppBottomBarItem {
  AppBottomBarItem({required this.tab});
  final Tabs tab;
  Widget get icon {
    switch (tab) {
      case Tabs.characters:
        return const Icon(Icons.person_rounded);
      case Tabs.episodes:
        return const Icon(Icons.movie_rounded);
      case Tabs.locations:
        return const Icon(Icons.map_rounded);

      default:
        return const Icon(Icons.house);
    }
  }

  String get label {
    switch (tab) {
      case Tabs.characters:
        return "Characters";
      case Tabs.episodes:
        return "Episodes";
      case Tabs.locations:
        return "Locations";

      default:
        return "Default";
    }
  }
}
