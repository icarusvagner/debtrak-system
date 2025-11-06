import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/data/debtors_data.dart';
import 'package:debtrak/widgets/widget_custom_card.dart';
import 'package:debtrak/widgets/widget_custom_textfield.dart';
import 'package:debtrak/widgets/widget_debtor_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DebtorsPage extends StatefulWidget {
  final int? id;
  const DebtorsPage({super.key, this.id});

  @override
  State<DebtorsPage> createState() => _DebtorsPageState();
}

class _DebtorsPageState extends State<DebtorsPage> {
  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();
    final data = DebtorsData();
    final filteredDebtor = data.debtors
        .where((i) => i.status != Status.paid)
        .toList();

    final filtersName = ["All", "Active", "Overdue", "Settled", "Archived"];
    String selectedStatus = "";
    final statusFilters = [
      {"label": "All", "icon": Icons.filter_alt_rounded},
      {"label": "Active", "icon": Icons.play_arrow_rounded},
      {"label": "Overdue", "icon": Icons.warning_amber_rounded},
      {"label": "Settled", "icon": Icons.check_circle_rounded},
      {"label": "Archived", "icon": Icons.archive_rounded},
    ];

    String selectedAmount = "";
    final amountFilters = [
      "Any Amount",
      "₱1 – ₱999",
      "₱1,000 – ₱4,999",
      "₱5,000 – ₱9,999",
      "₱10,000+",
    ];

    String selectedDateFilter = "";
    final dateFilters = [
      {"label": "This Month", "icon": Icons.calendar_month_rounded},
      {"label": "Next Month", "icon": Icons.date_range_rounded},
      {"label": "Overdue", "icon": Icons.timer_off_rounded},
    ];
    final sortOptions = [
      "Name (A–Z)",
      "Highest Debt",
      "Nearest Due Date",
      "Latest Added",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // blue gradient header
          Container(
            padding: EdgeInsets.all(15.0),
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [DebtrakPalette.blue.deep, DebtrakPalette.blue.dark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 46),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Active Debtors",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${filteredDebtor.length} Open Records",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 45),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                      const SizedBox(height: 40),

                      WidgetCustomTextfield(
                        controller: searchTextController,
                        suffixIcon: LucideIcons.search,
                        name: "Search debtor's name...",
                      ),

                      const SizedBox(height: 25),

                      /// Status filter
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: statusFilters.map((item) {
                            final label = item["label"] as String;
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FilterChip(
                                backgroundColor: Colors.white,
                                avatar: Icon(
                                  item["icon"] as IconData,
                                  size: 18,
                                  color: DebtrakPalette.blue.deep,
                                ),
                                label: Text(
                                  label,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: DebtrakPalette.blue.deep,
                                  ),
                                ),
                                selected: selectedStatus == label,
                                onSelected: (_) =>
                                    setState(() => selectedStatus = label),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 25),

                      /// Amount filter dropdown
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Date Filters",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: dateFilters.map((item) {
                          final label = item["label"] as String;

                          return FilterChip(
                            backgroundColor: Colors.white,
                            avatar: Icon(
                              item["icon"] as IconData,
                              size: 18,
                              color: DebtrakPalette.blue.deep,
                            ),
                            label: Text(
                              label,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: DebtrakPalette.blue.deep),
                            ),
                            selected: selectedDateFilter == label,
                            onSelected: (_) {
                              setState(() => selectedDateFilter = label);
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 25),

                      /// LIST OF DEBTORS
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredDebtor.length,
                        itemBuilder: (context, index) {
                          final debtor = filteredDebtor[index];
                          return WidgetCustomCard(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(15.0),
                            color: Colors.white,
                            child: WidgetDebtorCard(
                              id: debtor.id,
                              fullname: debtor.fullname,
                              balanceDebt: debtor.balanceDebt,
                              totalDebt: debtor.totalDebt,
                              status: debtor.status,
                              expectedEndDate: debtor.expectedEndDate,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        tooltip: "Add Debtor",
        onPressed: () {},
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}
