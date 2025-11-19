import 'package:debtrak/core/utils/constants.dart';
import 'package:debtrak/core/utils/layout_type.dart';
import 'package:debtrak/data/debtors_data.dart';
import 'package:debtrak/widgets/widget_page_header.dart';
import 'package:flutter/material.dart';
import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/widgets/widget_custom_card.dart';
import 'package:debtrak/widgets/widget_custom_textfield.dart';
import 'package:debtrak/widgets/widget_debtor_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

class DebtorsPageStateFul extends StatefulWidget {
  final int? id;
  const DebtorsPageStateFul({super.key, this.id});

  @override
  State<StatefulWidget> createState() => _DebtorsPageState();
}

class _DebtorsPageState extends State<DebtorsPageStateFul> {
  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();
    final data = DebtorsData();
    final filteredDebtor = data.debtors
        .where((i) => i.status != Status.paid)
        .toList();

    String selectedStatus = "";
    final statusFilters = [
      {"label": "All", "icon": LucideIcons.funnel},
      {"label": "Active", "icon": LucideIcons.play},
      {"label": "Overdue", "icon": LucideIcons.triangleAlert},
      {"label": "Settled", "icon": LucideIcons.circleCheckBig},
      {"label": "Archived", "icon": LucideIcons.archive},
    ];

    SortOptions selectedSortOptions;
    final sortOptions = [
      {"label": "Name (A-Z)", "value": SortOptions.nameAZ},
      {"label": "Highest Debt", "value": SortOptions.highestDebt},
      {"label": "Nearest Due Date", "value": SortOptions.nearestDueDate},
      {"label": "Latest Added", "value": SortOptions.latestAdded},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // blue gradient header
          WidgetPageHeader(height: 220),

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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 98),
                            Text(
                              "Active Debtors",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            PopupMenuButton<SortOptions>(
                              initialValue: SortOptions.nameAZ,
                              onSelected: (SortOptions val) => setState(() {
                                selectedSortOptions = val;
                              }),
                              icon: Icon(
                                LucideIcons.chevronDown,
                                color: Colors.white,
                              ),
                              itemBuilder: (BuildContext context) =>
                                  sortOptions.map((item) {
                                    final label = item["label"] as String;
                                    return PopupMenuItem<SortOptions>(
                                      value: item["value"] as SortOptions,
                                      child: Text(label),
                                    );
                                  }).toList(),
                            ),
                          ],
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
                    children: <Widget>[
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
        onPressed: () => Provider.of<LayoutController>(
          context,
          listen: false,
        ).setLayout(LayoutType.debtorsPage, args: 1),
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}
