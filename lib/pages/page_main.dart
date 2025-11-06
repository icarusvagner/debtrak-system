import 'package:date_time_format/date_time_format.dart';
import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/data/quick_action_details.dart';
import 'package:debtrak/widgets/widget_action_btn.dart';
import 'package:debtrak/widgets/widget_header_bar.dart';
import 'package:debtrak/widgets/widget_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final dateTime = DateTime.now();
  final quickActionDetails = QuickActionDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue gradient header
          Container(
            height: 410,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [DebtrakPalette.blue.deep, DebtrakPalette.blue.dark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 55),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                    child: Text(
                      DateTimeFormat.format(
                        dateTime,
                        format: AmericanDateFormats.standardWithComma,
                      ).toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Total net balance
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            LucideIcons.philippinePeso,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text(
                            "148,230",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Total net balance",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.white70, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomePageBalanceCard(
                          amount: 107890,
                          icon: Icons.remove,
                          color: Colors.red,
                          label: "Borrowed",
                        ),
                        VerticalDivider(
                          thickness: 2.0,
                          color: Colors.white,
                          width: 10.0,
                          indent: 10.0,
                          endIndent: 10.0,
                        ),
                        HomePageBalanceCard(
                          amount: 40340,
                          icon: Icons.add,
                          color: Colors.green,
                          label: "Remaining",
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Main content
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 26, 20, 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Quick actions
                      Text(
                        "Quick actions",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.outfit(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 14),

                      GridView.builder(
                        itemCount: quickActionDetails.actionButton.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 12.0,
                        ),
                        itemBuilder: (context, index) =>
                            WidgetQuickActionButton(
                              icon: quickActionDetails.actionButton[index].icon,
                              label:
                                  quickActionDetails.actionButton[index].label,
                              goToLayout: quickActionDetails
                                  .actionButton[index]
                                  .goToLayout,
                            ),
                      ),

                      const SizedBox(height: 25),

                      WidgetLineChartCard(),
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
