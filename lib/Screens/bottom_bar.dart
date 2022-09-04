import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Screens/login.dart';
import 'package:flutter_app/Screens/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    Login()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 8,
        destinations: const [
          NavigationDestination(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            label: "Home",
            selectedIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
          ),
          NavigationDestination(
            icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
            label: "Search",
            selectedIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
          ),
          NavigationDestination(
            icon: Icon(FluentSystemIcons.ic_fluent_person_accounts_regular),
            label: "Log In",
            selectedIcon:
                Icon(FluentSystemIcons.ic_fluent_person_accounts_filled),
          ),
        ],
      ),
    );
  }
}
