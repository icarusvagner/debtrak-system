import 'package:debtrak/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetCustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final IconData suffixIcon;
  final bool obsecureText;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final int? maxLines;
  final int? maxLength;

  const WidgetCustomTextfield({
    super.key,
    required this.controller,
    required this.name,
    required this.suffixIcon,
    this.obsecureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: true,
      maxLength: maxLength,
      minLines: 1,
      maxLines: maxLines,
      obscureText: obsecureText,
      keyboardType: textInputType,
      textAlign: TextAlign.left,
      style: GoogleFonts.roboto(color: Colors.black87, fontSize: 16),
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon, color: Colors.black54),
        isDense: true,
        labelText: name,
        counterText: "",
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withValues(alpha: 0.50)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DebtrakPalette.blue.strong),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DebtrakPalette.blue.light),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
