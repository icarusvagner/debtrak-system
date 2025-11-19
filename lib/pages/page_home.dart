import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/pages/debtors/page_debtor.dart';
import 'package:debtrak/pages/page_history.dart';
import 'package:debtrak/pages/home/page_main.dart';
import 'package:debtrak/pages/page_note.dart';
import 'package:debtrak/widgets/widget_bottom_navbar.dart';
import 'package:debtrak/widgets/widget_main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final layoutRoutes = <LayoutType, LayoutConfig>{
    LayoutType.homePage: LayoutConfig(
      builder: (args) => MainPage(canSetBalance: args),
    ),
    LayoutType.debtorsPage: LayoutConfig(
      builder: (args) => DebtorsPage(id: args),
    ),
    LayoutType.notesPage: LayoutConfig(builder: (args) => NotesPage(id: args)),
    LayoutType.historyPage: LayoutConfig(
      builder: (args) => HistoryPage(id: args),
    ),
  };

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LayoutController>(context);
    final layout = controller.getCurrent;

    return Scaffold(
      body: WidgetMainLayout(
        title: layoutNames[layout]!,
        currentIndx: controller.currentIndex,
        child: _buildBody(layout),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: DebtrakBottomNavbar(
        selectedIndx: controller.currentIndex,
        onTap: (index) => controller.setLayout(LayoutType.values[index]),
      ),
    );
  }

  Widget _buildBody(LayoutType layout) {
    final controller = Provider.of<LayoutController>(context);
    final config = layoutRoutes[layout]!;

    return config.build(controller.args);
  }
}
