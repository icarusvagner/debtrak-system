import 'package:debtrak/core/services/insert_service/balance.dart';
import 'package:debtrak/core/utils/colors.dart';
import 'package:debtrak/data/balance_amount_data.dart';
import 'package:debtrak/data/models/balance.dart';
import 'package:debtrak/widgets/widget_custom_textfield.dart';
import 'package:debtrak/widgets/widget_page_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:number_formatter2/number_formatter2.dart';

class PageSetNewBalance extends StatefulWidget {
  const PageSetNewBalance({super.key});

  @override
  State<PageSetNewBalance> createState() => _PageSetNewBalanceState();
}

class _PageSetNewBalanceState extends State<PageSetNewBalance> {
  final balanceInputController = TextEditingController();
  final choicesAmount = BalanceAmountData();

  @override
  void dispose() {
    balanceInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WidgetPageHeader(height: 200),

          /// Main page content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Set New Balance",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Update the current debt amount for this account.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 26, 15, 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choice an amount.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: choicesAmount.amounts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio:
                                  5.1, // adjusts button proportion
                            ),
                        itemBuilder: (context, index) {
                          final item = choicesAmount.amounts[index];
                          return CustomButton(
                            width: double.infinity,
                            outlined: true,
                            onTap: () => setState(
                              () => balanceInputController.text = item
                                  .onTap()!
                                  .toString(),
                            ),
                            child: Text(
                              NumberFormatter.format(item.label),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      WidgetCustomTextfield(
                        controller: balanceInputController,
                        suffixIcon: LucideIcons.wallet,
                        name: "Enter desired amount",
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            onTap: () {},
                            color: Colors.black.withValues(alpha: 0.08),
                            child: Text(
                              "Update Balance",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 20),
                          CustomButton(
                            onTap: _insertBalance,
                            color: DebtrakPalette.blue.strong,
                            child: Text(
                              "New Balance",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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

  _insertBalance() async {
    final raw = balanceInputController.text.replaceAll(',', '');
    final amount = int.tryParse(raw) ?? 0;
    final bal = Balance(
      amount: amount,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await BalanceRepository.insert(bal);
  }
}

class CustomButton extends StatefulWidget {
  final Color? color;
  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final bool? outlined;
  final Function() onTap;

  const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color,
    this.padding,
    this.width,
    this.outlined,
    this.height,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 180,
        height: widget.height ?? 37,
        padding:
            widget.padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: BoxBorder.all(
            width: widget.outlined ?? false ? 1.0 : 0.0,
            color: Colors.black.withValues(alpha: 0.30),
          ),
          color: widget.color ?? Colors.transparent,
        ),
        child: widget.child,
      ),
    );
  }
}
