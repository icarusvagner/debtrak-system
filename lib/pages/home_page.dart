import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/pages/debtor_page.dart';
import 'package:debtrak/pages/history_page.dart';
import 'package:debtrak/pages/main_page.dart';
import 'package:debtrak/pages/note_page.dart';
import 'package:debtrak/pages/reports_page.dart';
import 'package:debtrak/widgets/bottom_navbar.dart';
import 'package:debtrak/widgets/drawer_menu.dart';
import 'package:debtrak/widgets/header/actionsappbar.dart';
import 'package:debtrak/widgets/main_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LayoutType selectedLayout = LayoutType.homePage;

  final DateTime now = DateTime.now();

  final List<Widget> _pages = [
    // History Page
    const HistoryPage(),
    // Borrower / Debtor page
    const DebtorsPage(),
    // Main / Home page
    const MainPage(),
    // Notes page
    const NotesPage(),
    // Reports page
    const ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MainLayout(
        title: layoutNames[selectedLayout]!,
        currentIndx: selectedLayout.index,
        child: buildBody(),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: DebtrakBottomNavbar(
        selectedIndx: selectedLayout.index,
        onTap: (index) => setTab(index),
      ),
    );
  }

  Widget buildBody() => <LayoutType, WidgetBuilder>{
    LayoutType.historyPage: (_) => HistoryPage(),
    LayoutType.debtorsPage: (_) => DebtorsPage(),
    LayoutType.homePage: (_) => HomePage(),
    LayoutType.notesPage: (_) => NotesPage(),
    LayoutType.reportsPage: (_) => ReportsPage(),
  }[selectedLayout]!(context);

  void setLayout(LayoutType layout) => setState(() => selectedLayout = layout);

  void setTab(int index) => setLayout(LayoutType.values[index]);
}
