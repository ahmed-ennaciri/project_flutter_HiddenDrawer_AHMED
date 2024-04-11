import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:project_flutter/pages/home_page.dart';
import 'package:project_flutter/pages/settings_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final myTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Homepage',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
        ),
        HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Settings',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
        ),
        SettingsPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'abaout',
          baseStyle: TextStyle(),
          selectedStyle: TextStyle(),
          
        ),
        HomePage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Colors.deepPurple,
      initPositionSelected: 0,
      
    );
  }
}
