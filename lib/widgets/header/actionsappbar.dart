import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionsAppBar extends StatelessWidget {
  final String title;

  const ActionsAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(DebtrakColors().primary),
      pinned: true,
      expandedHeight: 80,
      toolbarHeight: 80,
      leading: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
            alignment: AlignmentGeometry.topCenter,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      foregroundColor: Color(DebtrakColors().secondary),
      surfaceTintColor: Color(DebtrakColors().secondary),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                textAlign: TextAlign.right,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
