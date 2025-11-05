import 'package:debtrak/component/header/actionsappbar.dart';
import 'package:debtrak/component/header/dateappbar.dart';
import 'package:debtrak/constant.dart';
import 'package:debtrak/pages/debtor.dart';
import 'package:debtrak/pages/history.dart';
import 'package:debtrak/pages/note.dart';
import 'package:debtrak/pages/page.dart';
import 'package:debtrak/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  final DateTime now = DateTime.now();

  List<Widget> pages = [
    HistoryPage(),
    DebtorsPage(),
    MainPage(),
    NotesPage(),
    SettingsPage(),
  ];
  List<String> pagesNames = ["History", "Debtors", "Home", "Notes", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          DateAppBar(),
          ActionsAppBar(title: pagesNames[_currentIndex]),
          SliverFillRemaining(child: pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF0D1B2A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: GNav(
            backgroundColor: Color(0xFF0D1B2A),
            activeColor: Color(0xFFE0E1DD),
            color: Color(0xFF778DA9),
            gap: 8,
            padding: EdgeInsets.all(8),
            tabBackgroundColor: Color(0xFF1B263B),
            iconSize: 26.0,
            textSize: 18,
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.history_outlined, text: "History"),
              GButton(icon: LucideIcons.handCoins400, text: "Debtors"),
              GButton(icon: Icons.home_outlined, text: "Home", active: true),
              GButton(icon: Icons.sticky_note_2_outlined, text: "Notes"),
              GButton(icon: Icons.settings_outlined, text: "Settings"),
            ],
          ),
        ),
      ),
    );
  }
}
