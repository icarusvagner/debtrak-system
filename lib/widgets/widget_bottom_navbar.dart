import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DebtrakBottomNavbar extends StatefulWidget {
  final void Function(int)? onTap;
  final int selectedIndx;

  const DebtrakBottomNavbar({
    super.key,
    required this.onTap,
    required this.selectedIndx,
  });

  @override
  State<DebtrakBottomNavbar> createState() => _DebtrakBottomNavbarState();
}

class _DebtrakBottomNavbarState extends State<DebtrakBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
          activeIcon: Icon(Icons.home_filled),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "Debtors",
          activeIcon: Icon(Icons.account_balance_wallet),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_alt_outlined),
          label: "Notes",
          activeIcon: Icon(Icons.note_alt),
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timeline_outlined),
          label: "History",
          activeIcon: Icon(Icons.timeline),
          backgroundColor: Colors.white,
        ),
      ],
      backgroundColor: Colors.white,
      fixedColor: DebtrakPalette.blue.strong,
      unselectedItemColor: Colors.grey.withValues(alpha: 0.50),
      currentIndex: widget.selectedIndx,
      iconSize: 30.0,
      selectedFontSize: 16.0,
      onTap: widget.onTap,
    );
  }
}
