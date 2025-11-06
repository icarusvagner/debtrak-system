import 'package:date_time_format/date_time_format.dart';
import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/data/history_data.dart';
import 'package:debtrak/widgets/widget_custom_card.dart';
import 'package:debtrak/widgets/widget_history_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:number_formatter2/number_formatter2.dart';

class HistoryPage extends StatelessWidget {
  final String? id;
  const HistoryPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    final data = HistoryData().histories;
    final totalSettledAmound = data.fold<int>(
      0,
      (sum, d) => sum + d.amountPaid,
    );
    final dateTime = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Blue gradient header
          Container(
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [DebtrakPalette.blue.deep, DebtrakPalette.blue.dark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Scroll view content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Settled Amount",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              DateTimeFormat.format(
                                dateTime,
                                format: AmericanDateFormats.standardWithComma,
                              ),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              LucideIcons.philippinePeso,
                              size: 32,
                              color: Colors.white,
                            ),
                            Text(
                              NumberFormatter.format(totalSettledAmound),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Transactions",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              LucideIcons.chevronDown,
                              size: 22,
                              color: Colors.black87,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Divider(),

                      // Main content
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => WidgetCustomCard(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: WidgetHistoryCard(
                            id: data[index].id,
                            amountPaid: data[index].amountPaid,
                            paymentMethod: data[index].paymentMethod,
                            dateSettled: data[index].dateSettled,
                            referenceNo: data[index].referenceNo,
                            debtor: data[index].debtor,
                            description: data[index].description,
                          ),
                        ),
                        itemCount: data.length,
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
