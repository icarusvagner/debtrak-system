import 'package:debtrak/widgets/widget_page_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewDebtorStateful extends StatefulWidget {
  const NewDebtorStateful({super.key});

  @override
  State<StatefulWidget> createState() => _NewDebtorState();
}

class _NewDebtorState extends State<NewDebtorStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WidgetPageHeader(height: 140),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add New Debtor",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "You can set the default interest rate of 2%",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
