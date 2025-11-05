import 'package:debtrak/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F2),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  "assets/images/Debtrak-Logo-dark.png",
                  height: 180,
                ),
              ),

              const SizedBox(height: 45.0),
              // Title
              Text(
                "Debtrak",
                style: GoogleFonts.outfit(
                  color: Color(0xFF1B4965),
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24.0),
              // Sub title
              Text(
                "Tracking your debts with clarity and ease.",
                style: GoogleFonts.inter(
                  color: Color(0xFF737373),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25.0),
              // Action button
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF0D1B2A),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "Start now",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
