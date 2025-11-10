import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/widgets/widget_custom_textfield.dart';
import 'package:debtrak/widgets/widget_page_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NewDebtorStateful extends StatefulWidget {
  const NewDebtorStateful({super.key});

  @override
  State<StatefulWidget> createState() => _NewDebtorState();
}

class _NewDebtorState extends State<NewDebtorStateful> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();
  final interestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WidgetPageHeader(height: 160),

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

                const SizedBox(height: 40),

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
                      const SizedBox(height: 25),

                      Text(
                        "Debtor's Information fields",
                        style: GoogleFonts.outfit(
                          color: Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                            child: WidgetCustomTextfield(
                              controller: fnameController,
                              name: "Firstname",
                              suffixIcon: LucideIcons.userRound,
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: WidgetCustomTextfield(
                              controller: lnameController,
                              name: "Lastname",
                              suffixIcon: LucideIcons.userRound,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      WidgetCustomTextfield(
                        controller: dateController,
                        name: "Date settled",
                        suffixIcon: Icons.calendar_month,
                        readOnly: true,
                        onTap: () => _selectDate(),
                      ),

                      const SizedBox(height: 15),

                      WidgetCustomTextfield(
                        controller: descController,
                        name: "Short description",
                        suffixIcon: Icons.edit,
                      ),

                      const SizedBox(height: 15),

                      WidgetCustomTextfield(
                        controller: interestController,
                        name: "Interest Rate",
                        suffixIcon: Icons.percent,
                      ),

                      const SizedBox(height: 30),

                      GestureDetector(
                        child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: DebtrakPalette.blue.deep,
                          ),
                          child: Text(
                            "Add Debtor",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2200),
    );

    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
