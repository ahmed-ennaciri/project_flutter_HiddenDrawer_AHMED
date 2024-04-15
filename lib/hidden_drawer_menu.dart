import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:project_flutter/pages/home_page.dart';
import 'package:project_flutter/pages/settings_page.dart';
import 'package:project_flutter/screens/notes_screen.dart';
import 'package:project_flutter/screens/examens.dart';
import 'package:project_flutter/screens/parascolaire.dart';
import 'package:project_flutter/screens/parascolaires.dart';
import 'package:project_flutter/screens/projets.dart';

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
          name: 'Devoirs',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
        ),
        NotesScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Examens',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
        ),
        ExamensScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Projets',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
        ),
        ProjetsScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Parascolaires',
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
        ),
        ParascolairesScreen(),
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
