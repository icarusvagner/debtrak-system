import 'package:flutter/material.dart';

class WidgetMainLayout extends StatefulWidget {
  final String title;
  final Widget child;
  final int currentIndx;

  const WidgetMainLayout({
    super.key,
    required this.title,
    required this.child,
    required this.currentIndx,
  });

  @override
  State<WidgetMainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<WidgetMainLayout> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: CustomScrollView(
        slivers: [SliverFillRemaining(child: widget.child)],
      ),
    ),
  );
}
