import 'package:debtrak/widgets/drawer_menu.dart';
import 'package:debtrak/widgets/header/actionsappbar.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final String title;
  final Widget child;
  final int currentIndx;

  const MainLayout({
    super.key,
    required this.title,
    required this.child,
    required this.currentIndx,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      slivers: [
        ActionsAppBar(title: widget.title),
        SliverFillRemaining(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: widget.child,
          ),
        ),
      ],
    ),
    drawer: DrawerMenu(),
  );
}
