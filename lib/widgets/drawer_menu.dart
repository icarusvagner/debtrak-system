import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 18.0,
                  children: [
                    Image.asset(
                      "assets/images/Debtrak-Logo.png",
                      color: Color(DebtrakColors().primary),
                      height: 50,
                    ),
                    Text(
                      "Debtrak",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.outfit(
                        color: Color(DebtrakColors().primary),
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text("Home", style: GoogleFonts.inter(fontSize: 16)),
                  onTap: () => Navigator.pushNamed(context, "/home"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(LucideIcons.history500),
                  title: Text(
                    "History",
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                  onTap: () => Navigator.pushNamed(context, "/history"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(LucideIcons.handCoins500),
                  title: Text(
                    "Debtors",
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                  onTap: () => Navigator.pushNamed(context, "/debtors"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.sticky_note_2_outlined),
                  title: Text("Notes", style: GoogleFonts.inter(fontSize: 16)),
                  onTap: () => Navigator.pushNamed(context, "/notes"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(LucideIcons.chartPie500),
                  title: Text(
                    "Reports",
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                  onTap: () => Navigator.pushNamed(context, "/reports"),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.inter(fontSize: 16),
                  ),
                  onTap: () => Navigator.pushNamed(context, "/settings"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.power_settings_new_outlined),
              title: Text("Quit", style: GoogleFonts.inter(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
